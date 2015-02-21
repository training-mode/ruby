#Loops#

If I asked you to write a program that prints ```Hi, mom!``` three times, how would you write it?  Probably something like this:

```ruby
puts "Hi, mom!"
puts "Hi, mom!"
puts "Hi, mom!"
```

That's manageable, isn't it? Okay, but what if I asked you to do the same thing except 1000 times? A million times? This is where **loops** come to the rescue.

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

Similar to ```unless``` and ```if```, ```until``` mirrors the behavior of ```while``` except it tests that a certain condition is false rather than true.

```ruby
count = 10

until count < 1
    puts "T-minus #{count}..."
    count -= 1
end

puts "Blast off!"
```

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

#Assignment#
names.rb

```ruby
```
