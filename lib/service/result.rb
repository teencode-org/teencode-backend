module Service
  class Result < Promise
    alias succeed fulfill
    alias fail reject
    alias succeeded? fulfilled?
    alias failed? rejected?

    def on_success
      yield value if succeeded?
      self
    end

    def on_failure
      yield reason if failed?
    end
  end
end
