class Movie < ActiveRecord::Base
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  validates :title, presence: true
  validates :year, presence: true, numericality: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year}
end
