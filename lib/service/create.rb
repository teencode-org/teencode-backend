module Service
  class Create < Base
    private def perform(klass)
      Result.new.tap do |result|
        if valid?
          catch_uniqueness_error do
            record = klass.create!(changeset)
            result.succeed(record)
          end
        end

        result.fail(errors)
      end
    end
  end
end
