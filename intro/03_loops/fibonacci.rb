# Print out all the Fibonacci numbers from 1 to 10 in order

# Your code goes here

def fibo(n)
    n <= 2 ? 1 : fibo(n-1) + fibo(n-2)
  end
  p (1..10).map{|x| fibo(x)}