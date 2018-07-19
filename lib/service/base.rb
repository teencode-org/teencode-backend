class Base
  include ActiveModel::Validations

  Result = Struct.new(:state, :value)

  # null-ish
  NOT_SET = Object.new
  def NOT_SET.try!(*_)
    NOT_SET
  end

  def self.perform(*args, **params)
    klass = params.any? ? new(*args, **params) : new(*args)
    klass.perform
  end

  def self.fields
    @fields ||= []
  end

  def self.field(name, optional: false, **_validations)
    attr_reader name
    fields << name.to_sym
  end

  private def changeset
    self.class.fields.inject({}) do |h, f|
      send(f).eql?(NOT_SET) ? h : h.merge(f => send(f))
    end
  end

  private def handle_success(record)
    Result.new(true, record)
  end

  private def handle_failure(record)
    Result.new(false, record)
  end
end
