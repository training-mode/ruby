# Print out all the Fibonacci numbers from 1 to 10 in order

# Your code goes here

a, b = 0, 1

for i in 1..10
    a, b = b, a+b
    puts a
end
