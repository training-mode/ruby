#Modules#

Sometimes referred to as **namespaces**, modules are a way to organize related pieces of code together. Constants, functions, and even classes can be contained in a module.

##Namespacing##

"Why bother?"

Imagine you are working on a bigger codebase and you decide to incorporate a helpful package written by a third party. In the absence of modules, it becomes increasingly likely you will encounter a name collision. For instance, if you have classes and functions with common names such as "Document" or "read," sooner or later you're bound to clash with other pieces of code. Modules are a solution to this kind of problem.

```ruby
module Word
  class Document
  end
end

module Pdf
  class Document
  end
end

document1 = Word::Document.new
document2 = Pdf::Document.new
```

The **scope resolution operator**, ```::```, is used to reference something contained in a module. Constants are a good candidate for storage in a namespace:

```ruby
module Cardinal
  NORTH = 0
  SOUTH = 1
  EAST  = 2
  WEST  = 3
end

class Compass
  attr_accessor :direction

  def initialize
    @direction = Cardinal::NORTH
  end
end

compass = Compass.new
compass.direction = Cardinal::EAST
``` 

Likewise functions and even nested modules can be enclosed by a namespace:

```ruby
module Physics
  module Newtonian
    # Include module name before method name
    def Newtonian.calculate_force(mass, acceleration)
      mass * acceleration
    end
  end

  module Einsteinian
    SPEED_OF_LIGHT = 299792458
  end
end

force = Physics::Newtonian::calculate_force(10, 2)
speed = Physics::Einsteinian::SPEED_OF_LIGHT
```

As you can see, by deeply nesting modules, it becomes more of burden to type. That ultimately is the tradeff between safety and convenience. However, if you're the type that favors convenience, Ruby allows you to do the following:

```ruby
Isaac = Physics::Newtonian
puts Isaac::calculate_force(20, 2)
```

In this way, ```Isaac``` is an **alias** for the nested module.

Hopefully these snippets have highlighted the benefits of namespacing in your programs.

##Mixins##

Although I emphasized that multiple inheritance is disallowed in Ruby, the truth is that you can achieve a similar effect by using classes and modules together. The secret lies in the keyword ```include``` and **mixins**.

```ruby
module RunnableMixin
  attr_reader :is_running

  def run
    unless @is_running
      @is_running = true
      puts "#{self.class}: Started running"
    end
  end

  def stop
    if @is_running
      @is_running = false
      puts "#{self.class}: Stopped running"
    end
  end
end

module FlyableMixin
  attr_reader :is_flying

  def fly
    # Only fly if not already flying
    unless @is_flying
      @is_flying = true
      puts "#{self.class}: Took flight"
    end
  end

  def land
    # Only land if currently flying
    if @is_flying
      @is_flying = false
      puts "#{self.class}: Landed"
    end
  end
end

class Rocket
  include FlyableMixin
end

class Bird
  include FlyableMixin
  include RunnableMixin
end

rocket = Rocket.new
bird = Bird.new

bird.fly                # Bird: Took flight
puts bird.is_flying     # true
bird.land               # Bird: Landed
bird.run                # Bird: Started running
bird.stop               # Bird: Stopped running
```

Mixins are used to add attributes and methods to classes. In real life, a rocket and a bird are very dissimilar, but when modeled in software, they very well could be alike in some ways. In the example above, you can make a Rocket and a Bird both "flyable" but only a Bird "runnable." Even though ```is_running``` and ```is_flying``` aren't declared as instance variables in either class, the mixin updates the classes to make them compatible.

Can you imagine a scenario where this might be useful? As a matter of fact, in game development, combining characteristics in this way can be quite common. Think about which game objects should be able to run, jump, fly, or be destructable and think how different those game entities could be.

A less common feature of mixins is achieved through the ```extend``` keyword.

```ruby
module Mixin
  def info
    puts "This is a class-level function"
  end
end

class Building
  extend Mixin
end

Building.info           # This is a class-level function
```

When combined with a class, ```extend``` will incorporate a mixin module's functions at the class level rather than the instance level.

##Require##

You might recall from earlier content that these kind of statements were included in some of the examples and assignments:

```ruby
require "date"
require "open-uri"
```

When you ```require``` a file, you are loading its contents into your application. Ruby is conveniently bundled with a lot of helpful packages like these, making your life as a programmer easier. It's a good practice to keep logical parts of your code in seperate files. Trust me, you don't want to have to wade through excessively long source files if it can be avoided.

The ```require``` method attempts to load a Ruby file that exists on your environment **path**. Since ```date``` is automatically in the correct location, it should work right out of the box. However, if you have files in the same directory, for example, you might want to use ```require_relative``` instead:

```ruby
# file1.rb
require "date"

module MyDate
  def MyDate.today
    Date.today
  end
end
```

```ruby
# file2.rb
require_relative "file1"

today = MyDate::today
```

As you can see, using ```require_relative``` can be easier when importing files that are close to one another in a project.

##Final Thoughts##

After taking all this in, you might be wondering to yourself, "Modules seem pretty similar to classes. How are they *different*?" Good question. Well, the main difference is that you **cannot** instantiate a module. That feature is still reserved for classes. If you intend to use modules in an object-oriented manner, at the end of the day, you will still need an instance of a class, otherwise you will just have a collection of constants and functions.

#Knowledge Check#

1. Can you declare private methods in a Module? 

#Assignment#
1. mixins.rb
2. fighter.rb

"Be water, my friend."

A legendary entertainer and arguably the greatest martial artist of the 20th century, Bruce Lee is a hero to many. Rather than be constrained by dogma, his *Jeet Kune Do* took elements from a number of fighting styles. In this assignment, I'd like you to add fighting techniques to WingChunMixin, BoxingMixin, and FencingMixin. Using your knowledge from this unit, synthesize these styles into the JeetKuneDoMixin. Finally, combine this mixin with the Fighter class so that Bruce Lee may live in code.
