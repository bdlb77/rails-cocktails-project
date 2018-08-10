# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'


Cocktail.destroy_all

puts "commencing seed."
request_uri = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url = "#{request_uri}"
buffer_url = open(url).read

ingredients = JSON.parse(buffer_url)

ingredients["drinks"].each do |ingredient|
	Ingredient.create(name: ingredient["strIngredient1"])
end
puts "finished!"