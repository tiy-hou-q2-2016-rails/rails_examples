class Album < ActiveRecord::Base
  # auto linked to albums table

  validates :title, presence: true
  validates :artist_id, presence: true
  belongs_to :artist

  # def artist
  # end

end
