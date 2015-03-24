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
  end

  def login
    until @is_authenticated
      # Your code goes here
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
