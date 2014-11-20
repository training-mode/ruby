Basics
====

Everyone knows ["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program), right?

Well, in case you don't remember, the way to do it in Ruby is:
```ruby
puts "Hello, world!"
```

There are also a few ways to declare and assign **variables**. If you want to declare a string (i.e. a sequence of text), you can do it like this:
```ruby
variable_name = "programming"
```

If you want to declare a number, do it like so:
```ruby
book_count = 5
gpa = 3.7
```

Remember, these **objects** are called variables because they can be *changed*.
```ruby
book_count = 5
book_count = book_count + 2
book_count += 2 #Same as previous statement
book_count = 0
```

How do you change strings in Ruby? Well, there are a lot of ways. If you can imagine it, there's probably a way to do it quite easily in Ruby.

```ruby
title = "The Matrix"
title.upcase #Temporarily modifies title to THE MATRIX
title.upcase! #Modifies string "in place": title permanently changed
title.downcase!
```

Understanding whether or not you want to modify a variable in *in place* can be important depending on your program, so make sure you understand the difference.

You'll often need to **concatenate** strings in your programming, so here's how:
```ruby
title = "The Lord of the Rings"
title = title + ": The Return of the King"
```

Essentially, you've combined two strings into one. Pretty convenient.

Arguably, the most flexible way to manipulate strings in Ruby is through **string interpolation**. Probably the easiest way to think about it is you specify a format that the final output should have and then plug in all the **arguments** that need to be used:
```ruby
franchise = "Final Fantasy"
number = 7
game = "#{franchise} #{number}" #Final Fantasy 7
```

See how flexible it is? You can mix and match variables of different types.

If you expect a value to never change during the life of a program, that's a **constant** and should be treated specially. In some other languages, it is impossible to change a constant after it's been created. Although the Ruby interpreter can't enforce this in the same way, it can alert you with warnings if something in your program tries to change a constant.

```ruby
GRAVITATIONAL_CONST = 9.8
GRAVITATIONAL_CONST = 28 #This will cause a warning
```

#Assignment#
Create a program that adds all the age
