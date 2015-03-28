#YAML#

Sending Objects over the internet and between applications is a very common task in programming. For smaller, self-contained programs, you are unlikely ever going to need to **serialize** and **deserialize** your Ruby Objects into other formats: you'll just use the Objects in their natural representation. However, as your applications grow and become increasingly interconnected with other programs, you'll soon find that not everything is written in Ruby! For example, a Java Object is not the same as a Ruby Object.

If you had to create equivalent data structures in both, how would you go about doing that? That very question is the starting point for data serialization and markup languages like YAML. Although originally named **Yet Another Markup Language**, YAML was later changed to **YAML Ain't Markup Language**, a recursive acronym, when its scope outgrew its beginnings.

##Example##

YAML functionality is not included in the Ruby interpreter by default. To begin working with YAML, you must ```require``` the YAML module which ships with the Ruby installation.

```ruby
require "yaml"

class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Meal
  attr_accessor :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add(item)
    @items << item
  end
end

# Build Ruby Objects
toast = Item.new("Toast")
butter = Item.new("Butter")

breakfast = Meal.new("Breakfast")
breakfast.add(toast)
breakfast.add(butter)

burger = Item.new("Burger")
fries = Item.new("Fries")

lunch = Meal.new("Lunch")
lunch.add(burger)
lunch.add(fries)

# Serialize to YAML Objects and write to file
yaml_data = [breakfast, lunch].to_yaml
File.open("meals.yml", "w") { |file| file.write yaml_data }

# Convert YAML to Ruby Objects
ruby_data = YAML::load yaml_data

# Load YAML from file
ruby_from_file = YAML.load_file "meals.yml"
```

The output saved to meals.yml:
```yaml
---
- !ruby/object:Meal
  name: Breakfast
  items:
  - !ruby/object:Item
    name: Toast
  - !ruby/object:Item
    name: Butter
- !ruby/object:Meal
  name: Lunch
  items:
  - !ruby/object:Item
    name: Burger
  - !ruby/object:Item
    name: Fries
```

As you can see, a YAML document has a well-defined structure for representing data and it's *human-readable*. The magic words for converting a Ruby Object to a YAML equivalent is the method ```to_yaml```. Likewise, to deserialize YAML into Ruby Objects, you can either use ```YAML::load``` for existing YAML data, or you can use ```YAML.load_file``` to translate a full YAML document.

##What About CSV?##

In previous modules, we've used CSV files to store Object attributes that are later converted into known classes, and it worked perfectly fine. What advantages does YAML have over it?

The main point to recognize about the CSV format is that it works great for representing a matrix of "flat" data structures. A CSV file is like a spreadsheet that only contains numbers and Strings: none of the individual cell items are more complicated Objects with their own sets of attributes. Those kinds of Objects cannot be easily represented in the same way. Conversely, serialization formats like YAML do in fact preserve more complicated data structures. For times when you need that additional complexity, YAML can be a desirable solution.

#Knowledge Check#

1. When you serialize a Ruby Object into YAML, are methods also represented in the output document?

#Assignment#
1. order.rb
2. order.yml

When was the last time you ordered a movie from Amazon? How about the last time you went grocery shopping? In this assignment, you will implement a basic calculator that reads a file, ```order.yml```, and prints a receipt of the items, their total cost, the taxed amount, and the grand total as you would see in a typical bill or invoice. Make note that this assignment uses the BigDecimal module for greater price accuracy.
