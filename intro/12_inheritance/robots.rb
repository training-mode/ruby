class Robot
  # Your code goes here
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def foo
        puts "In Robot's foo"
    end
end

class Ultron < Robot
  # Your code goes here
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def foo
        puts "In Ultron's foo"
    end
end

class MegaMan < Robot
  # Your code goes here
    attr_reader :name

    def initialie(name)
        @name = name
    end

    def foo
        puts "In megaMan's foo"
    end
end

class Glados < Robot
  # Your code goes here
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def foo
        super
        puts "In Glados's foo"
        super
    end
end


r1 = Robot.new("robot1")
p r1
r1.foo

m1 = MegaMan.new("mega1")
p m1
m1.foo

g1 = Glados.new("glados1")
p g1
g1.foo
