# Basics

Everyone knows ["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program), right?

Well, in case you don't remember, the way to do it in Ruby is:
```ruby
puts "Hello, world!"
```

## Variables
You can declare and assign **variables** of different **types**. Whether it's a number, text, or something more complex, there's a particular kind of **syntax** for its creation or modification.

For example, if you want to declare a String (i.e. a sequence of text), you can do it like this:
```ruby
variable_name = "programming" # Don't forget to surround with double quotes
```

If you want to declare a number, do it like so:
```ruby
book_count = 5 # Integer
gpa = 3.7      # Float
```

Remember, these **objects** are called variables because they can be *changed*.
```ruby
book_count = 5
book_count = book_count + 2
book_count += 2             # Same as previous statement
book_count = 30/2           # Division
book_count = 4*6            # Multiplication
book_count = 3**2           # Exponents
```

See those symbols? ```+```, ```/```, etc.? They're called **operators**. You'll often be using them in the same way you write down math by hand.

How do you change Strings in Ruby? Well, there are a lot of ways. If you can imagine it, there's probably a way to do it quite easily in Ruby.

```ruby
title = "The Matrix"
title.upcase         # Returns an uppercase copy of String (THE MATRIX)
title.upcase!        # Modifies String "in place": title permanently changed
title.downcase!
```

Understanding whether or not you want to modify a variable in *in place* can be important depending on your program, so make sure you understand the difference. While we'll talk about it more later, simply put, adding a "!" to an object's **method** is short-hand for doing something *in place*.

You'll often need to **concatenate** Strings in your programming, so here's how:
```ruby
title = "The Lord of the Rings"
title += ": The Return of the King"
```

Essentially, you've combined two Strings into one. Pretty convenient. Can you do more?
```ruby
language = "Ruby"
language * 3      # RubyRubyRuby
```

Is that what you expected? If so, then you're thinking like a Rubyist. When Ruby was created, it was meant to be an expressive and productive language. It should be easy to do things like this, not frustrating and verbose! Ruby will allow you to get relatively a lot done without you having to write a lot of code yourself.

Arguably, the most flexible way to manipulate Strings in Ruby is through **String interpolation**. Probably the easiest way to think about it is you specify a format that the final output should have and then plug in all the **arguments** that need to be used:
```ruby
franchise = "Final Fantasy"
number = 7
game = "#{franchise} #{number}" # Final Fantasy 7
```

See how flexible it is? You can mix and match variables of different types.

## Constants
If you expect a value to never change during the life of a program, that's a **constant** and should be treated specially. In some other languages, it is impossible to change a constant after it's been created. Although the Ruby interpreter can't enforce this in the same way, it can alert you with warnings if something in your program tries to change a constant.

```ruby
GRAVITATIONAL_CONST = 9.8
GRAVITATIONAL_CONST = 28  # This will cause a warning
```

*Note: It is convention to declare constants this way. Remember to declare it with all caps.*

# Knowledge Check

1. Who is the principal designer of the Ruby language?

# Assignment
family.rb
```ruby
# Ages of family members
mom = 48
dad = 51
john = 18
mary = 16
```

Using the above code, create a program which declares a variable, **age_sum**, that stores the sum of ages of each family member. Also create a variable, **result**, which multiples the mom and dad's ages together and divides that by the difference between John and Mary's ages.

The program should print the following to the console:
```ruby
Sum of ages = # ? 
Result      = # ?
```

*Extra Credit: The program should also print the message shown above, but with each line reversed.*
