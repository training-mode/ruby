#Procs and Lambdas#

In an earlier module, we covered the basics of Blocks and how they can be passed to functions. The content of this section is closely related but also particularly nuanced considering the slight differences between Blocks, *Procs* and *Lambdas*.

##Blocks##

The main difference between Blocks and the others is that they are *not* objects. We have not yet covered this topic in detail, but we will in the subsequent module. Suffice it to say, Blocks are short-lived and one of the few constructs in the Ruby language that are not truly objects. It might be easier to characterize them as part of the syntax of a function.

```ruby
{ puts "This will not print" }      # SyntaxError
sound = { puts "Meow" }             # SyntaxError
[3, 4, 5].each { |x| puts x**3 }    # Okay!
```

As you can see, Blocks can't be executed by themselves, nor can they can be assigned to a variable and reused. Blocks are only valid when passed as an argument to a compatible function. Finally, you can pass at most *one* block as an argument to a function.

##Procs##

Conceptually, Procs are reusable Blocks. They *can* be declared and used later. Functions that accept Blocks will also work with Procs:

```ruby
squared = Proc.new { |x| x**2 }
to_string = Proc.new { |x| x.to_s }

array1 = [10, 11, 12]
array1.map!(&squared)       # [100, 121, 144]
array1.map!(&to_string)     # ["100", "121", "144"]

array2 = [100, 110, 120]
array2.map!(&squared)       # [10000, 12100, 14400]
array2.map!(&to_string)     # ["10000", "12100", "14400"]
```


#Assignment#
?.rb

```ruby
# Your code goes here

```
