#Exceptions#

Sometimes, software can go awry. As we all know, when applications go wrong, they can go very, *very* wrong. This is usually a result of a program reaching an unanticipated or erroneous state. In order to manage these dangerous parts of programming, it is common for programmers to make use of **Exceptions**.

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

When you write your own applications, you might decide that you want to define your own Exception classes to highlight errors that are unique to your own project. In such circumstances, it's advised that you inherit from the StandardError class:

```ruby
class MyException < StandardError
end
```
There are a couple dozen built-in Exception descedant types in Ruby. If you'd like to know what they are, I recommend reviewing the class hierarchy in the official Ruby documentation.

#Assignment#
?.rb

```ruby
# Your code goes here
```
