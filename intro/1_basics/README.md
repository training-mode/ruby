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

Remember, these objects are called variables because they can be *changed*.
```ruby
book_count = 5
book_count = book_count + 2
book_count = 0
```

If you expect a value to never change during the life of a program, that's a *constant* and should be treated specially. In some other languages, it is impossible to change a constant after it's been created. Although the Ruby interpreter can't enforce this in the same way, it can alert you with warnings if something in your program tries to change a constant.

```ruby
GRAVITATIONAL_CONST = 9.8
GRAVITATIONAL_CONST = 28 #This will cause a warning
```
