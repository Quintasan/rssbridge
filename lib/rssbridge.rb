# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.log! if ENV['ENABLE_ZEITWERK_LOGGING']
loader.setup

Bundler.require(:default, :development)

module Rssbridge
  @bridges = []

  class << self
    attr_accessor :bridges

    def load_bridges
      return unless self.bridges.empty?

      seen = {}

      Gem.find_files("rssbridge/bridge/*_bridge.rb").each do |bridge_path|
        name = File.basename(plugin_path, "_bridge.rb")

        next if seen[name]
        seen[name] = true

        require plugin_path
        self.extensions << name
      end
    end
  end
end
