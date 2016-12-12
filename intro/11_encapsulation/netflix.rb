class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end
end

class NetflixAccount
  # Your code goes here

  def initialize(username)
    @username = username
    @my_list = []
    @recently_watched = []
  end

  def add_to_my_list(movie)
    # Your code goes here
    if movie.is_a? Movie
        @my_list.push(movie)
    end
  end

  def remove_from_my_list(movie)
    # Your code goes here
    if movie.instance_of?(Movie)
        puts "#{movie.title} removed from the list."
    end
  end

  def watch(movie)
    # Your code goes here
    if movie.kind_of?(Movie)
        puts "Now, #{@username} are watching #{movie.title}."
        @my_list.delete(movie)
    end
  end
end

movies = [
  Movie.new("Seven Samurai"), 
  Movie.new("Wall Street"), 
  Movie.new("Big Hero 6")
]

account = NetflixAccount.new("user123")
account.watch(movies[0])
account.add_to_my_list(movies[1])
account.add_to_my_list(movies[2])
account.remove_from_my_list(movies[2])
