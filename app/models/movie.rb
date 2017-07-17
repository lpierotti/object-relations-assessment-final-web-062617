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
