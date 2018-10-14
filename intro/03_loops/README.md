# Loops

If I asked you to write a program that prints ```Hi, mom!``` three times, how would you write it?  Probably something like this:

```ruby
puts "Hi, mom!"
puts "Hi, mom!"
puts "Hi, mom!"
```

That's manageable, isn't it? Okay, but what if I asked you to do the same thing except 1000 times? A million times? This is where **loops** come to the rescue.

## While

```ruby
count = 0

while count < 1000
  puts "Hi, mom!"
  count += 1          # Important!
end
```

Let's break it down. The block of code contained in the ```while``` section is repeated as long as the variable ```count``` is less than 1000. It's very important you increment count here so that it eventually reaches its termination condition, otherwise you'll end up with an **infinite loop**.

```ruby
count = 0

while count < 1000      # Count will never equal 1000
  puts "Hi, mom!"     # "Hi, mom!" x infinity
end
```

## Until

Similar to ```unless``` and ```if```, ```until``` mirrors the behavior of ```while``` except it tests that a certain condition is false rather than true.

```ruby
count = 10

until count < 1
  puts "T-minus #{count}..."
  count -= 1
end

puts "Blast off!"
```

## For

**For-loops** are a common and popular alternative to **while-loops** when you must repeat a sequence of code a certain number of times. We can rewrite the above examples in the following way:

```ruby
for i in 1..1000
  puts "Hi, mom!"
end
```

```ruby
for count in 10.downto(1)
  puts "T-minus #{count}..."
end

puts "Blast off!" 
```

Seems pretty succinct, doesn't it? Well, Ruby offers you this additional style:

```ruby
(1..3).each do |i|
  puts "Round #{i} - FIGHT!" 
end
```

The important thing to note about these for-loops is that they are storing the iteration of the loop in a variable which can be used inside the loop's scope. If you don't care about that, you might want to use something like this instead:

```ruby
1000.times do
  puts "Am I under arrest?"
end
```

## Loop

The last kind I'd like to mention is invoked using the ```loop``` keyword. Go figure.

```ruby
coin_flips = 0

loop do
  coin_flips += 1
  puts "Coin flipped #{coin_flips} times."

  if coin_flips == 100
      break
  end
end

puts "Game Over"
```

## Break

Anything that you put in a ```loop``` block will happen infinitely unless you use the keyword ```break```. Using ```break``` inside of a loop will cause the program to leave that block of code and return to the next highest scope. Let's get a bit more complicated and show what that means.

```ruby
while true
  while true
    puts "Inner block"
    break
  end

  puts "Outer block"
  break
end
```

Without the ```break``` keyword in nested loop, we would have an infinite loop that prints ```Inner block```. Likewise, without the second ```break```, there'd be an infinite loop of ```Outer block```. However, since we have both, the above code will only print:

```ruby
Inner block
Outer block
```

From this, we can see that the break statement will only escape from whatever the immediate loop block of code is and return to the next highest scope.

## Next

The next closest relative to ```break``` is the keyword **next**. Using ```next``` in a loop will immediately skip to the subsequent iteration of the loop, ignoring the rest of the statements in the block.

```ruby
(0...4).each do |i| # ... is exclusive rather than inclusive (..)
  next if i < 2     # Ignore the rest of the loop and begin a new iteration

  puts "The value of i is #{i}"
end
```

Since the above code skips the block when i is 0 and 1, the output of this code is:

```ruby
The value of i is 2
The value of i is 3
```

As you can see, while ```break``` leaves the entire enclosing loop immediately, ```next``` just skips to the next iteration.

Finally, although Ruby also offers the ```redo``` and ```retry``` keywords when working with loops, you probably won't need to know them right now. If you're curious, please look them up and think of ways to use them.

# Knowledge Check

1. Are variables declared in a for-loop available after a loop has ended?

# Assignment
fibonacci.rb

The Fibonacci sequence is a popular programming exercise for new programmers. If you're not familiar with it, the first ten Fibonacci numbers are 1, 1, 2, 3, 5, 8, 13, 21, 34, and 55. You should be able to see a pattern in this sequence. Using conditionals and looping techniques we've covered so far, write some code that will print each of first ten Fibonacci numbers on its own line.

```ruby
# Print out all the Fibonacci numbers from 1 to 10 in order

# Your code goes here

```
