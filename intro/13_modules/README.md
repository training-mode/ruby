#Modules#

Sometimes referred to as **namespaces**, modules are a way to organize related pieces of code together. Constants, functions, and even classes can be contained in a module.

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

The **scope resolution operator**, ```::```, is used to reference something contained in a module. Whether that's a constant:

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

#Assignment#
?.rb

```ruby
# Your code goes here
```
