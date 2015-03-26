require "bigdecimal"
require "yaml"

class Item
  attr_reader :name
  attr_reader :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Order
  @@WIDTH1 = 20
  @@WIDTH2 = 8
  @@SALES_TAX_RATE = 0.08875
  attr_reader :items
  
  def initialize
    @items = []
  end

  def add(item)
    # Your code goes here
  end

  def print_receipt
    @items.each do |item|
      puts "#{item.name.ljust(@@WIDTH1)}" + 
        "#{item.price.truncate(2).to_s("F").rjust(@@WIDTH2)}"
    end
    puts "".ljust(@@WIDTH1 + @@WIDTH2, "=")
    puts "#{"Total".ljust(@@WIDTH1)}" + 
      "#{base.truncate(2).to_s("F").rjust(@@WIDTH2)}"
    puts "#{"Tax".ljust(@@WIDTH1)}#{tax.truncate(2).to_s("F").rjust(@@WIDTH2)}"
    puts "".ljust(@@WIDTH1 + @@WIDTH2, "=")
    puts "#{"Grand Total".ljust(@@WIDTH1)}" + 
      "#{total_cost.truncate(2).to_s("F").rjust(@@WIDTH2)}"
  end

  private
  def base
    # Your code goes here
  end

  private
  def tax
    # Your code goes here
  end

  private
  def total_cost
    # Your code goes here
  end
end

order = YAML.load_file "order.yml"
order.print_receipt
