class Player
  # Your code goes here
    def initialize(name)
        @name = name
    end
end

class Game
  # Your code goes here
    @@MAX_PLAYER_COUNT = 0  

    attr_accessor :players

    def initialize(name)
        @name = name
        @players = Array.new
    end

    def Game.MAX_PLAYER_COUNT
        @@MAX_PLAYER_COUNT
    end

    def add_player(player)
        case player
        when Player
            self.players.push(player)
        when Fixnum 
            @@MAX_PLAYER_COUNT = player
        else
            # do nothing
        end
    end
end

game = Game.new("RPS")

players = [
  Player.new("John"), 
  Player.new("Lizzy"), 
  Player.new("Clair"), 
  Player.new("Brad"), 
  15
]

players.each { |player| game.add_player(player) }

p game
p Game.MAX_PLAYER_COUNT
