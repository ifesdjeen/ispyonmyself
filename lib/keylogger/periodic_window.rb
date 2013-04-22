module Keylogger

  class PeriodicWindow
    def initialize(initial_value, period, aggregate, emit)
      @period = period
      @initial_value = initial_value
      @aggregate = aggregate
      @emit = emit
      self.reset()
    end

    def reset
      @start = Time.now.to_i
      @value = @initial_value
    end

    def enqueue(value)
      self.tick
      @value = @aggregate.call(@value, value)
    end

    def tick
      if expired?
        @emit.call(@value)
        self.reset
      end
    end

    def expired?
      Time.now.to_i - @start > @period
    end
  end

end
