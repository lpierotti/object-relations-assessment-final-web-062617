# Please copy/paste all three classes into this file to submit your solution!

class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	self.all.find do |viewer|
  		name == viewer.full_name
  	end
  end

  def create_rating(score, movie)
  	new_rating = Rating.new(score, self, movie)
  	new_rating
  end

end




class Rating
  attr_accessor :score, :viewer, :movie

  @@all =[]

  def initialize(score, viewer, movie)
  	@score = score
  	@viewer = viewer
  	@movie = movie
  	@@all << self
  end

  def self.all
  	@@all
  end
end





class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
  	@@all
  end

  def self.find_by_title(title)
  	self.all.find do |movie|
  		title == movie.title
  	end
  end

  def ratings
  	Rating.all.select do |rating|
  		rating.movie == self
  	end
  end

  def viewers
  	self.ratings.map do |rating|
  		rating.viewer
  	end.uniq
  end

  def average_rating
  	total_ratings = 0.0
  	self.ratings.each do |rating|
  		total_ratings += rating.score
  	end
  	total_ratings / self.ratings.length
  end	
end

