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

#Assignment#
?.rb

```ruby
# Your code goes here
```
