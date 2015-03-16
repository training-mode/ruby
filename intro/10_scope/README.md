#Scope#

Although we haven't discussed visibility at length in earlier modules, we've already been dealing with it in form or another.

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
class ErrorMessages
    $ERROR1_CONST = "You did something bad!"
    $ERROR2_CONST = "You did something REALLY bad!"
    $ERROR3_CONST = "Oh no..!"
end

puts "#{$ERROR1_CONST} {$ERROR2_CONST} {$ERROR3_CONST}" # Accessible anywhere!
```

```ruby
class Television
    def initialize(width, resolution, hertz)
        @width = width
        @resolution = resolution
        @hertz = hertz
    end
end
```

```ruby
tv1 = Television.new(32, 1080, 60)
tv1.width       # NoMethodError
```

#Assignment#
?.rb

```ruby
# Your code goes here

```
