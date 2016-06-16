require 'faker'
require 'csv'

CSV.open("./products.csv", "wb") do |file|

  file << ["id", "name", "description", "image", "price", "category"]

  50.times do |i|
    file << [
      i+1,
      Faker::Commerce.product_name,
      Faker::Hipster.paragraph(2, false, 4),
      Faker::Avatar.image(i+1, "500x500", "png"),
      Faker::Commerce.price,
      Faker::Commerce.department
    ]

  end


end
