require 'redis'

module Rssbridge
  module Cache
    def cache
      Cache.cache
    end

    def self.cache
      @redis ||= Redis.new(
        host: ENV.fetch("REDIS_HOST", "localhost"),
        port: ENV.fetch("REDIS_PORT", 6379),
        db: ENV.fetch("REDIS_DATABASE", 5)
      )
    end
  end
end
