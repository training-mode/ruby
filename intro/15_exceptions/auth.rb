require "csv"
require "logger"

class AuthenticationError < StandardError
end

class User
  attr_reader :username
  attr_reader :password

  def initialize(username, password)
    raise ArgumentError unless /^[A-Za-z0-9_-]{3,16}$/.match(username)
    raise ArgumentError unless /^[A-Za-z0-9!@#$%^&*()_+-=]{6,16}$/.match(password)
    @username = username
    @password = password
  end
end

class Application
  def initialize
    @logger = Logger.new(STDOUT)
    @users = {}
    @is_authenticated = false
  end

  def load_users(filename)
    # Your code goes here
    begin
        file = CSV.read(filename)
        file.each do |arr|
            @users[arr[0]] = arr[1]
        end
    rescue Errno::ENOENT => ex
        @logger.warn("File '#{filename}' does not exist")
        raise ex
    end
  end

  def login
    until @is_authenticated
      # Your code goes here
        begin
            @users.each do |name, passwd|
                User.new(name, passwd)
            end
        rescue
            @logger.info('Loggin failed!')
            return
        else
            @is_authenticated = true
        end
    end

    @logger.info("Login successful!")
  end

  def run
    login
  end
end

application = Application.new
application.load_users("users.csv")
application.run
