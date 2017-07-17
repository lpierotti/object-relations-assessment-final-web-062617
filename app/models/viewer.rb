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
