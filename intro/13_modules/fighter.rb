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
end

fighter = Fighter.new("Bruce Lee")
fighter.uppercut
fighter.block
fighter.riposte
fighter.straight_kick
