class Artist < ApplicationRecord
  has_many :albums
  attr_accessor :new_album_name

  validates :name, presence: true
  validates :new_album_name, presence: true, on: :create
end
