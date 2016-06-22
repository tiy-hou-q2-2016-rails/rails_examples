# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = [
  "Taylor Swift",
  "James Taylor",
  "Aerosmith",
  "Aquaman",
  "Def Leppard",
  "Cake",
  "Greenday",
  "Guns n Roses",
  "Weezer",
  "Nirvana",
]

names.each do |name|
  artist = Artist.new
  artist.name = name
  if artist.save
    puts "Created #{name}"
  else
    puts "DID NOT CREATE #{name}"
  end
end
