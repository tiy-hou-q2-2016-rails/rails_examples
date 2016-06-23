class Artist < ActiveRecord::Base
  # auto linked to artists table

  validates :name, presence: true
  has_many :albums

  # def albums
  #   []
  # end

  # def albums
  #   Album.where artist_id: @artist_id
  #   select * from albums where artist_id = @artist_id
  # end

end
