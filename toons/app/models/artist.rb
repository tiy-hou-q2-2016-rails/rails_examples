class Artist < ActiveRecord::Base
  # auto linked to artists table

  validates :name, presence: true
end
