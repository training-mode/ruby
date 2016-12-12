# Height in meters
towers = [
  { :name => "Berliner Fernsehturm", :height => 368.0 }, 
  { :name => "Canton Tower", :height => 600.0 }, 
  { :name => "Eiffel Tower", :height => 324.0 }, 
  { :name => "Tokyo Tower", :height => 332.6 },  
  { :name => "Stratosphere Tower", :height => 350.2 } 
]

factor = 100/2.54   # Converts centimeters to inches

conversion = lambda do |x|
  # Your code goes here
    for item in x
        converted_height = sprintf('%.1f', item[:height] / factor)
        puts "%-25s => %s" % [item[:name], converted_height]
    end
end


# Your code goes here
sorted_array = towers.sort do |a, b|
    b[:height] <=> a[:height]
end


conversion.call(sorted_array)

