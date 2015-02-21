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

Let's break it down. The block of code contained in the ```while``` section is repeated as long as the variable ```count`` is less than 1000. It's very important you increment count here so that it eventually reaches its termination condition, otherwise you'll end up with an **infinite loop**.

```ruby
count = 0
while count < 1000 do   # Count will never equal 1000
    puts "Hi, mom!"
end
```



#Assignment#
names.rb

```ruby
```
