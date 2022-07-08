# frozen_string_literal: true

module Limiter
  class DistributedQueue < BaseQueue
    def initialize(size, key, interval: 60, &blk)
      @ring = Ring.new(size, key, EPOCH)
      @interval = interval
      @blk = blk
    end

    def shift
      time = nil

      @ring.lock do
        sleep_until(@ring.current + @interval, Proc.new { @ring.now } )
        @ring.rotate!
      end

      time
    end
  end
end
