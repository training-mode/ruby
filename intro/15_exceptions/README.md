#Exceptions#

Sometimes, software can go awry. As we all know, when applications go wrong, they can go very, *very* wrong. This is usually a result of a program reaching an unanticipated or erroneous state. In order to manage these dangerous parts of programming, it is common for programmers to make use of **Exceptions**.

##Raise##

An Exception is a special kind of Object that, when **raised** (i.e. thrown), terminates an application immediately. However, Exceptions are typically not used by themselves. As a matter of fact, your application can terminate gracefully or even recover with the help of an **exception handler**, a block of code which executes when a certain kind of Exception is raised.

```ruby
puts "All systems go..."
raise "This is an error message"    # RuntimeError
puts "What happened?"               # Never executed
```

The ```raise``` keyword will trigger an Exception. In this case, an untyped raise will produce a RuntimeError by default and terminate the script before it can execute the last statement. If you want to specify the type of Exception, you need to add the class name directly after ```raise```:

```ruby
raise TypeError, "Argument is not of the desired type (Character)"
```

##Custom Exceptions##

When you write your own applications, you might decide that you want to define your own Exception classes to highlight errors that are unique to your own project. In such circumstances, it's advised that you inherit from the StandardError class:

```ruby
class MyException < StandardError
end
```
There are a couple dozen built-in Exception descedant types in Ruby. If you'd like to know what they are, I recommend reviewing the class hierarchy in the official Ruby documentation.

##Exception Handlers##

The structure for handling an Exception is a block of code wrapped in ```begin```, ```rescue```, and ```end```. To illustrate this, let's update the first example from this module:

```ruby
begin
  puts "All systems go..."
  raise "This is an error message"
rescue Exception => e
  puts e.message                    # If you want more information, 
  puts e.backtrace.inspect          # You can see the error details
  puts "Fix the problem here"
end

puts "What happened?"               # Okay
```

The statements which follow ```begin``` are what the program should do under normal circumstances. However, the statements following ```rescue``` are instructions that should be executed following a certain kind of error. Whether it's terminating a program with an error message or performing some kind of recovery, that's up to you.

One thing to note about the previous snippet is that when used alone, ```rescue``` will match with all kinds of Exceptions that are raised. Although it's tempting to do so, it is considered bad practice to catch errors this way. By using such code, when an Exception occurs your application will tell you no useful informtion when something goes wrong. All you will see is one exit point from the block of code. A much better approach is to handle individual Exception types:

```ruby
begin
  # Your expected code
rescue MyException
  # What happens when MyException is raised
rescue TypeError
  # How to handle a TypeError
rescue ArgumentError
  # Something different for ArgumentError
else
  # For all other Exceptions (not ideal, but possible)
end
```

One final feature to consider in an exception handler is the ```ensure``` keyword. Instructions that follow ```ensure``` are executed whether an Exception is raised or not! A traditional use-case for this kind of feature is to clean up application resources when something goes wrong. For example, if an error occurs while you're in the middle of writing to a file or a database, you'd want to close anything that might be still open.

```ruby
begin
  # Usually executes, no problem
rescue
  # Sometimes or never
ensure
  # Always executes
end
```

*Side note: in other languages, these keywords are usually named the following:*

Ruby   | Other
-------|------
raise  | throw
begin  | try
rescue | catch
ensure | finally

##Common Errors##

###User Input###

Whenever you prompt a user for input, they have the freedom to type to just about anything. If you write your code naively like this:

```ruby
puts "Please enter a number between 0 and 9:"
number = gets.chomp.to_i
```

you're opening up your program to a logical error. When ```to_i``` is called on a String that can't be converted into an Integer, it returns 0 by default *which would appear to be correct (i.e. a number between 0 and 9)*. Likewise, the user is free to enter numbers outside of the mandated range, opening up the application to a different error.

A much better solution would be something like:

```ruby
is_valid = false

until is_valid
  begin
    puts "Please enter a number between 0 and 9:"
    number = Integer(gets.chomp)    # Can raise an ArgumentError
    raise ArgumentError unless number.between?(0, 9)
    is_valid = true
  rescue ArgumentError
    puts "Invalid input. Please try again:"
  end
end
```

###Opening a File###

Sometimes you're going to need to read from a file. What's wrong with this code?

```ruby
some_file = File.open("some_file", "r")
```

There's no guarantee that some_file actually exists at that location! Try one of these instead:

```ruby
some_file = File.open("some_file", "r") unless File.exists?("some_file")
```

```ruby
some_file = File.open("some_file", "r") rescue nil
```

```ruby
filename = "some_file"

begin
  some_file = File.open(filename, "r")
rescue Errno::ENOENT
  puts "File '#{filename}' does not exist"
end
```

###Divide by Zero###

This is so common, it's one of Ruby's built-in Exceptions.

```ruby
budget = 100
number_of_children = 0
allowance_per_child = budget / number_of_children   # ZeroDivisionError
```

A solution:

```ruby
budget = 100
number_of_children = 0

begin
  allowance_per_child = budget / number_of_children
rescue ZeroDivisionError
  allowance_per_child = 0
end
```

##Final Thoughts##

You will always have discretion on when and where to address errors in your code. With that said, many programmers would agree that throwing an error "early" and catching it "late" is a best practice. What this is really getting at is the idea that handling errors at the "higher" levels of your code (i.e. those closer to the end user) is better than fixing them far too soon.

For the sake of example, imagine you're reading in a file which contains information on real estate properties. It's often the case that the raw data you're working with is incomplete or perhaps even wrong. When you're converting those entries into Property instances, during the validation process you have the choice of raising an ArgumentError or handling the error immediately.

properties.csv (Bad zip and rent input)

street        |city    |state|zip  |rent
--------------|--------|-----|-----|---------
Awesome Street|New York|NY   |     |2400
Tiny Road     |Roanoke |VA   |24011|xfxx00
101st Ave     |Seattle |WA   |98101|-98000000

```ruby
require "csv"

class Property
  def initialize(street, city, state, zip, rent)
    # Handle errors here?
    @street = street
    @city = city
    @state = state
    @zip = zip
    @rent = rent
  end
end

def convert_to_property(array)
  # Or here?
end

properties_file = CSV.read("properties.csv")
properties_file.each do |line|
  convert_to_property line
end
```

If you opt for the latter, you are making a judgment that an error must be corrected whenever a Property instance cannot be created, *regardless* of how your program is creating that kind of Object. In the case of the former, you are placing the responsibility on the higher levels of your application on what is the proper course of action. In that way, it's potentially more flexible and easier to debug when Exceptions are passed up the chain.

#Knowledge Check#

1. What is the parent class of NoMethodError?

#Assignment#
1. auth.rb
2. users.csv

Authentication exists in all kinds of applications. In this assignment, your task is to write robust implementations for the methods ```load_users``` and ```login```. I've added a sample CSV file with two valid entries and one invalid pair. To help you out, I've already included some validation in the User ```new``` method to guide you towards your solution.

*Side note: Never, under ANY circumstances, store login credentials in plain text. This is purely meant to be instructive and NOT a real world solution. Passwords should always be encrypted in some way.*
