require 'tty-logger'

module Rssbridge
  module Logger
    def logger
      Logger.logger
    end

    def self.logger
      @logger ||= TTY::Logger.new
    end
  end
end
