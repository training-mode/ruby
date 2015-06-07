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
  return x + y          # This function returns the sum of x and y
end

def multiply(x, y)
  x * y                 # Implicit return: returns the product of x and y
end

def roll_dice(sides=6)              # Default parameter
  return rand(sides) + 1
end

jump                                    # You jumped!
puts(add(multiply(2,3), multiply(3,4))  # puts(add(6, 12))
                                        # puts(18)
roll_dice                               # rand(6) + 1
roll_dice(12)                           # rand(12) + 1
```

As you can see above, functions can either **return** a value or not. In ```jump```, the function merely prints some text by itself. On the other hand, ```add``` and ```multiply``` return a value when the function is executed. In the case of ```add```, the function explicitly uses the keyword ```return```. This need not be the case, as you can see in ```multiply```. This is an example of what makes Ruby different from many other languages. **Implicit return** automatically returns whatever the evaluation of the final line in a function is.

Having seen the above examples, outside of syntax errors, can you think of any ways the above code will behave in unexpected ways? What do you think will happen here?

```ruby
add([1,2], [3,4])   # [1, 2, 3, 4]
add([], 1)          # no implicit conversion of Fixnum into Array (TypeError)
add(1, "Hi")        # String can't be coerced into Fixnum (TypeError)
```

This is where we run into the philosophy of the Ruby language and the concept of **Duck Typing**. In many other languages, function parameters must be explicitly typed in the function definition. If you call that function at any point in your program, you *have* to provide the correct arguments to it or your program will not even compile. You'll often hear the terms **static** and **dynamic** thrown around when discussing typing, and of the two, Ruby falls in with the latter.

This flexibility means that your code can react in multiple ways depending on the type of the objects being manipulated. As you can see above, this can be a double-edged sword if you're not careful. Since Ruby programs are not compiled, errors like this will only be discovered once a program executes (known as a **runtime exception**). As you become more experienced, writing your code with a dynamically typed mindset will become increasingly easy.

Sometimes it makes sense for a function to have more than one return statement. In fact, it's fairly common for a function to return early based on some conditional checks:

```ruby
def validate_user(username)
  if username == "admin"
    return true
  elsif username == "BillLumbergh"
    return true
  end

  return false
end

# FYI, you can rewrite the function like this
def validate_user1(username)
  return username == "admin" || username == "BillLumbergh"
end

# Potentially even better
def validate_user2(username)
  authorized_users = ["admin", "BillLumbergh"]

  return authorized_users.include? username
end
```

Early return statements can often allow programmers to debug a flow of execution more easily. You'll definitely run into this kind of thing in the future, so it's good idea to get a handle on it. 

The last thing I'd like to cover regarding functions is **recursion**. Did you know that a function can return itself? Well, they can! Do you remember the Fibonacci assignment from the Loop module? It turns out that you can solve it pretty easily through recursion:

```ruby
def fibonacci(n)
  return 1 if n == 1 || n == 2

  return fibonacci(n - 1) + fibonacci(n - 2)
end

# Alternative
def fibonacci1(n)
  n <= 2 ? 1 : fibonacci1(n - 1) + fibonacci1(n - 2)
end

for i in 1..10
  puts fibonacci(i)
end
```

Really clean, isn't it? You can think of recursion as the functional analogue to loops. It may take some cognitive rewiring for you to incorporate recursion into your own programming, but it can be a very valuable skill for you to have. But on that note, do you see anything wrong with the code above? How about this...

```ruby
puts fibonacci(-1)  # stack level too deep (SystemStackError)
```

Much like loops, recursion is susceptible to the same problem. **Infinite recursion** will repeat until a program's stack runs out of memory. If you've ever heard of the term **stack overflow**, this is an example of that.

##Why?##

1. Reusability: functions eliminate redudant parts of your code. This allows you to use a logical piece of programming repeatedly and easily (and even in other programs).
2. Organization: a function definition isolates a program's behavior into one place. When something goes wrong, it's easier to identify the problem.

#Knowledge Check#
1. Does a function call incur any overhead? In other words, is it faster to execute a series of instructions or a function with the same instructions?
2. What is a default parameter?

#Assignment#
card_deck.rb

Just about every home has a deck of cards hanging around somewhere. Are they Bicycle brand? What I'd like you to do is define a function, ```create_deck```, that returns an array of Strings. Each element in the array represents a card, and the cards are sorted in the order of Hearts, Diamonds, Clubs, then Spades, with each suit sorted in ascending order (from 2 to Ace).


```ruby
def create_deck
  # Your code goes here
end

card_deck = create_deck

puts card_deck[0] == "2h"   # 2 of Hearts
puts card_deck[8] == "10h"  # 10 of Hearts
puts card_deck[51] == "As"  # Ace of Spades
```
