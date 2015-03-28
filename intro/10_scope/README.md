#Scope#

Although we haven't discussed visibility at length in earlier modules, we've already been dealing with it in one form or another.

##Local##

```ruby
[1, 2, 3].each { |x| puts x }

puts x      # NameError
```

Variables declared inside a block only exist within that block. Attempting to access them outside of that results in a NameError.

```ruby
require "open-uri"
require "json"

def load_reddit
  json_object = JSON.parse(open("https://www.reddit.com/.json").read)
end

json_object     # NameError
```

The same is true for variables declared within a function. Only what is returned by the function is available to callers.

**Local** scope is the most limited visibility in an application and represents the shortest lifetime of a variable. When execution reaches the end of a block, the locally declared variable is no longer accessible and will be destroyed.

##Instance##

As discussed in the previous module, **instance**-level scope pertains the visibility of data members to an individual Object. Although other instances of the same class can be created, they won't be able to access each other's values. Remember, instance variables are referenced with an ```@``` before the field name.

##Class##

**Class**-level visibility is usually saved for variables that are convenient to share between instances of class. Whether that's some kind of counter, a constant value, or something else, class variables can be useful in such cases. Class variables begin with ```@@```.

```ruby
class Simulator
  @@GRAV_ACCEL_CONST = 9.83
    
  # Other methods
end
```

##Global##

As their name implies, **global** scoped variables are visibile *anywhere* in your program. To declare a global, use the ```$``` character as a variable prefix.

While you might be tempted to include them often in your code, please resist! It is considered best practices to use global variables *sparingly*. "For what reasons?" you ask. That in itself can be a much longer discussion, but the gist of it is that since global variables are accessible anywhere in a program, it becomes a lot more difficult to debug a complex application. If you're really interested in making them a part of your skillset, you might want to consider using them mostly for constants rather than variables that might be changed in the future.

```ruby
class ErrorMessage
  $ERROR1 = "You did something bad!"
  $ERROR2 = "You did something REALLY bad!"
  $ERROR3 = "Oh no..!"
end

puts "#{$ERROR1} #{$ERROR2} #{$ERROR3}" # Accessible anywhere!
```

#Knowledge Check#

1. What is the scope of variables declared in for-loops?

#Assignment#
basic_game.rb

If you play any sort of multiplayer games, you'll understand that there's usually a process for adding additional players. For arcade games, you'd insert your tokens and press Start. For online games, you have to enter a matchmaking portal to find your opponents.

In this assignment, you will need to define two classes: **Player** and **Game**. A Player can have many different attributes, but at a minimum, define a **name**. The Game class should have two fields: **name** and **players**. The players attribute should be an array which will store Player instances. The Game class should also have a method, **add_player**, which will you will need to complete. Remember, defensive programming is a virtue! Arguments passed to a method should be validated and checked for correctness before updating an instance. To that end, incorporate a class variable, **MAX_PLAYER_COUNT**, that is used in your method.

```ruby
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
```
