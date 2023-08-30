# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

user = User.create!(email: "user12@example.com", password: "password")

# Load JSON data
json_data = File.read(Rails.root.join('db', 'map_data.json'))
data = JSON.parse(json_data)

# Loop through data and create records
data.each do |entry|
  Add.create!(
    title: entry["title"],
    description: entry["description"],
    address: entry["address"],
    price: entry["price"],
    user_id: user.id  # Associate the existing user
  )
end

Home.create!(
  title: entry["title"],
  rating: entry["rating"],
  photo_url: entry["photo_url"],
)
