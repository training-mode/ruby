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

while count < 1000 do
    puts "Hi, mom!"
    count += 1          # Important!
end
```

Let's break it down. The block of code contained in the ```while``` section is repeated as long as the variable ```count``` is less than 1000. It's very important you increment count here so that it eventually reaches its termination condition, otherwise you'll end up with an **infinite loop**.

```ruby
count = 0

while count < 1000 do   # Count will never equal 1000
    puts "Hi, mom!"     # "Hi, mom!" x infinity
end
```

Similar to ```unless``` and ```if```, ```until``` mirrors the behavior of ```while``` except it tests that a certain condition is false rather than true.

```ruby
count = 10

until count < 1 do
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

#Assignment#
names.rb

```ruby
```
