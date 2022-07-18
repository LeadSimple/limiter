# frozen_string_literal: true

require 'forwardable'

module Limiter
  class BaseQueue
    extend Forwardable

    EPOCH = 0.0

    def shift
      raise ArgumentError, "This method should be implemented in a child class"
    end

    # Sometimes we will use the queues directly to check for rate limits,
    # and calling `#shift` doesn't make much sense when we are talking
    # from a rate limit point of view - it only makes sense if we know the underlying
    # building block is based in a Ring data structure
    def_delegator :self, :shift, :check!

    private

    def sleep_until(time, clock_time = Proc.new { clock.time })
      interval = time - clock_time.call
      return unless interval.positive?
      @blk.call if @blk
      clock.sleep(interval)
    end

    def clock
      Clock
    end
  end
end
