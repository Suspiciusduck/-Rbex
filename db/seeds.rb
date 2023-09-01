# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Add.destroy_all
User.destroy_all
Reservation.destroy_all

require 'json'

user = User.create!(email: "user14@example.com", password: "password")

# Load JSON data
json_data = File.read(Rails.root.join('db', 'map_data.json'))
data = JSON.parse(json_data)

# Loop through data and create records
data.each do |entry|

  rating = rand(3.0..5.0).round(2)
  add_new = Add.new(
    title: entry["title"],
    description: entry["description"],
    city: entry["city"],
    price: entry["price"],
    user_id: user.id,
    rating: rating,
    latitude: entry["x"],
    longitude: entry["y"]
  )
  add_new.save!
end
