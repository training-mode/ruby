require "logger"
require_relative "mixins"

module Logging
  # Provided for your convenience
  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end

class Fighter
  # Your code goes here
    include WingChunMixin
 #   include BoxingMixin
    include FencingMixin
    include JeetKuneDoMixin

    include Logging

    def initialize(name)
        @name = name
    end

    def uppercut
        BoxingMixin::uppercut
        self.logger.info('Yaha!')
    end
end

fighter = Fighter.new("Bruce Lee")
fighter.uppercut
fighter.block
fighter.riposte
fighter.straight_kick
