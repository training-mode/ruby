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

The structure for handling an Exception is a block of code wrapped in ```begin``, ```rescue```, and ```end```. To illustrate this, let's update the first example from this module:

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
begin  | try
rescue | catch
ensure | finall

#Assignment#
?.rb

```ruby
# Your code goes here
```
