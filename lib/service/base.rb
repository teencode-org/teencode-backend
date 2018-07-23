class Base
  include ActiveModel::Validations

  # null-ish
  NOT_SET = Object.new
  def NOT_SET.try!(*_)
    NOT_SET
  end

  def self.perform(*args, **params)
    klass = params.any? ? new(*args, **params) : new(*args)
    klass.perform_in_transaction
  end

  def self.fields
    @fields ||= []
  end

  def self.field(name, optional: false, **validations)
    attr_reader name
    fields << name.to_sym

    if optional && validations.any?
      validates name, validations.merge(unless: -> { send(name).eql(NOT_SET) })
    elsif validations.any?
      validates name, validations
    end
  end

  private def changeset
    self.class.fields.inject({}) do |h, f|
      send(f).eql?(NOT_SET) ? h : h.merge(f => send(f))
    end
  end

  def perform_in_transaction
    transaction { perform }
  end

  private def transaction
    result = nil
    ActiveRecord::Base.transaction do
      result = yield
      result.on_failure { raise ActiveRecord::Rollback }
    end
    result
  end

  # forgiveness is faster than permission
  private def catch_uniqueness_error
    yield
  rescue ActiveRecord::RecordNotUnique => e
    field = e.cause.message.match(/index_([a-z_]*)_on_([a-z_]*)/)[2]

    raise unless field

    errors.add(field, :taken)
  end
end
