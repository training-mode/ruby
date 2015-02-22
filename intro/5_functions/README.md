#Functions#

Repeating yourself can be very frustrating. The same holds true when you're coding. If you find yourself writing the same set of instructions over and over again, you've probably found a good opportunity to reorganize your code with a **function**. Known by many names (including **subroutine**, **subprogram**, **method** and more), functions are a boon to reusability and programming productivity. In software development, you'll often hear of the virtue of **DRY**: Don't Repeat Yourself.

##How?##

```ruby
def greeting(person)
    puts "Hello, #{person}."
end

greeting("Clarice")             # Hello, Clarice.
```

The syntax of a basic function is shown above. Using the keyword ```def```, you can declare a function for use in other parts of your code. In the above example, ```person``` is called a function **parameter**. According to your program, the function only expects one object to be passed to it. To execute a function, you use the syntax ```function_name(argument)```. Make note that parameters and **arguments** are conceptually the same except that parameter is the name of what appears in the function signature whereas argument represents the concrete object passed in a function call.

##Why?##

##Knowledge Check##
1. ?

#Assignment#
?.rb



```ruby

# Your code goes here

```
