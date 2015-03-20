class Player
  # Your code goes here
end

class Game
  # Your code goes here
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
