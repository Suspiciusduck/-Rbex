# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

locations = JSON.parse(File.read('map_data.json'))

locations["location"].each do |location|
  Location.create(
    name: location["name"],
    description: location["description"],
    category: location["category"]
  )
end
