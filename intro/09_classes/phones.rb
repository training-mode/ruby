require "date"

class Phone
  # Your code goes here
    def initialize(brand, model, os, release)
        @brand = brand
        @model = model
        @os = os
        @release = release
    end
end

phones = [
  {
    :brand              => "Apple", 
    :model              => "iPhone 1st gen", 
    :operating_system   => "iPhone OS 1.0", 
    :release_date       => Date.new(2007, 6, 29)
  },
  {
    :brand              => "Google", 
    :model              => "Nexus One", 
    :operating_system   => "Android 2.1 Eclair", 
    :release_date       => Date.new(2010, 1, 5)
  },
  {
    :brand              => "Samsung", 
    :model              => "Galaxy S", 
    :operating_system   => "Android 2.3.6 Gingerbread", 
    :release_date       => Date.new(2010, 6, 4)
  }
]

new_phones = []

# Your code goes here
for p in phones
    new_phones.push(Phone.new(p[:brand], p[:model], p[:operation_system], p[:release_date]))
end

p new_phones
