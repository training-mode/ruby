#Functions#

Repeating yourself can be very frustrating. The same holds true when you're coding. If you find yourself writing the same set of instructions over and over again, you've probably found a good opportunity to reorganize your code with a **function**. Known by many names (including **subroutine**, **subprogram**, **method** and more), functions are a boon to reusability and programming productivity. In software development, you'll often hear of the virtue of **DRY**: Don't Repeat Yourself.

##How?##

```ruby
def greeting(person)
    puts "Hello, #{person}."
end

greeting("Clarice")             # Hello, Clarice.
greeting "Clarice"              # Hello, Clarice.
```

The syntax of a basic function is shown above. Using the keyword ```def```, you can declare a function for use in other parts of your code. In the above example, ```person``` is called a function **parameter**. According to your program, the function only expects one object to be passed to it. To execute a function, you use the syntax ```function_name(argument)```. Make note that parameters and **arguments** are conceptually the same except that parameter is the name of what appears in the function signature whereas argument represents the concrete object passed in a function call.

You might have noticed in the example above that you *can* omit the parentheses around the function argument when calling it. We have seen that many times before when using the ```puts``` function. For functions with a limited number of simple arguments, this can be convenient. However, for functions with more complicated arguments, the readability of your code improves with the inclusion of the explicit parentheses.

```ruby
def jump                # No arguments
    puts "You jumped!"
end

def add(x, y)
    return x + y        # This function returns the sum of x and y
end

def multiply(x, y)
    x * y               # Implicit return: returns the product of x and y
end

jump                                    # You jumped!
puts(add(multiply(2,3), multiply(3,4))  # puts(add(6, 12))
                                        # puts(18)

```

As you can see above, functions can either **return** a value or not. In ```jump```, the function merely prints some text by itself. On the other hand, ```add``` and ```multiply``` return a value when the function is executed. In the case of ```add```, the function explicitly uses the keyword ```return```. This need not be the case, as you can see in ```multiply```. This is an example of what makes Ruby different from many other languages. **Implicit return** automatically returns whatever the evaluation of the final line in a function is.

Having seen the above examples, outside of syntax errors, can you think of any ways the above code will behave in unexpected ways? What do you think will happen here?

```ruby
add([1,2], [3,4])   # [1, 2, 3, 4]
add([], 1)          # no implicit conversion of Fixnum into Array (TypeError)
add(1, "Hi")        # String can't be coerced into Fixnum (TypeError)
```

This is where we run into the philosophy of the Ruby language and the concept of **Duck Typing**. In many other languages, function parameters must be explicitly specified in the function definition. If you call that function at any point in your program, you *have* to provide the correct arguments to it or your program will not even compile. You'll often hear the terms **static** and **dynamic** thrown around when discussing typing, and of the two, Ruby falls in with the latter.

This flexibility means that your code can react in multiple ways depending on the type of the objects being manipulated. As you can see above, this can be a double-edged sword if you're not careful. Since Ruby programs are not compiled, errors like this will only be discovered once a program executes (known as a **runtime exception**). As you become more experienced, writing your code with a dynamically typed mindset will become increasingly easy.

##Why?##

##Knowledge Check##
1. ?

#Assignment#
?.rb



```ruby

# Your code goes here

```
