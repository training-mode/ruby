#YAML#

Sending Objects over the internet and between applications is a very common task in programming. For smaller, self-contained programs, you are unlikely ever going to need to **serialize** and **deserialize** your Ruby Objects into other formats: you'll just use the Objects in their natural representation. However, as your applications grow and become increasingly interconnected with other programs, you'll soon find that not everything is written in Ruby! For example, a Java Object is not the same as a Ruby Object.

If you had to create equivalent data structures in both, how would you go about doing that? 

#Assignment#
?.rb
