#Modules#

Sometimes referred to as **namespaces**, modules are a way to organize related pieces of code together. Constants, functions, and even classes can be contained in a module.

##Namespacing##

"Why bother?"

Imagine you are working on a bigger codebase and you decide to incorporate a helpful package written by a third party. In the absence of modules, it becomes increasingly likely you will encounter a name collision. For instance, if you have classes and functions with common names such as "Document" or "read," sooner or later you're bound to clash with other pieces of code. Modules are a solution to this kind of problem.

```ruby
module Word
    class Document
        def initialize
        end
    end
end

module Pdf
    class Document
        def initialize
        end
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

#Assignment#
?.rb

```ruby
# Your code goes here
```
