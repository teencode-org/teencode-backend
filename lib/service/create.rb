module Service
  class Create < Base
    private def perform(klass)
      record = klass.new(changeset)
      if record.save
        handle_success(record)
      else
        handle_failure(record)
      end
    end
  end
end