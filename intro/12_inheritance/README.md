#Inheritance#

The past couple of modules should have given you some practice on how to describe abstract and concrete things as Objects. Classes represent things as having attributes and methods. Wouldn't it be convenient if we could reuse these classes for related Objects without having to rewrite essentially the same code? That's where **inheritance** comes in.

##Basic##

In programming, inheritance is a process that allows one class to take on the attributes and methods of a different class.

```ruby
class Sword
    def slash
        puts "Graaah!"
    end
end

class Katana < Sword
end

sword = Sword.new
katana = Katana.new

sword.slash         # Graaah!
katana.slash        # Graaah!
```

In this example, the Katana class inherits from the Sword class. The reason for this is that inheritance is meant to model an **is-a** relationship. Since a katana is a kind of sword, this makes sense. By contrast, a Katana class probably shouldn't inherit from an Axe class even though they're both sharp weapons. The relationship between a **parent** class and a **child** class should be logically close.

##Override and Extend##

The problem with the previous example is that it doesn't do anything interesting. The code above says that Swords and Katanas are essentially the same thing. Thankfully, inheritance gives us the freedom to customize or **extend** the original class' attributes and methods.

```ruby
class Sword
    def slash
        puts "Graaah!"
    end
end

class Katana < Sword
    # New field
    attr_reader :forger

    def initialize(forger)
        @forger = forger
    end

    def slash
        # Overrides parent class
        puts "Vanish!"
    end

    def parry
        # New method
        puts "Deflected"
    end
end
```

In a child class, you are allowed to add new attributes and methods, as shown in the updated Katana class. More interestingly, you can **override** methods so that a child class can do something different while preserving the rest of its characteristics. In real world applications, this can be a tremendous timesaver.

##Super##

When you override a method, you don't have to toss out everything. By using the keyword ```super```, you can still call the super class (a.k.a. parent class) method in addition to any new functionality.

```ruby
def slash
    # Overrides parent class
    super                       # Graaah!
    puts "Vanish!"
end
```

Note that you don't *have* to put ```super``` at the beginning of the method. As a matter of fact, the ordering of your call to the super class method could influence the behavior of your child class in a material way.

#Assignment#
?.rb

```ruby
# Your code goes here
```
