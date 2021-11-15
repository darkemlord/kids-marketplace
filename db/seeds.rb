# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting everything...."
Toy.destroy_all
puts "Destroyed toys."

User.destroy_all
puts "Destroyed users."

puts "creating stuff...."

gareth = User.create!(email: "gareth@lewagon.com", password: "123456789" )
anju = User.create!(email: "anju@lewagon.com", password: "123456789" )
emanuel = User.create!(email: "emanuel@lewagon.com", password: "123456789" )
louis = User.create!(email: "louis@lewagon.com", password: "123456789" )

users = [gareth, anju, emanuel, louis]

puts "created users"

toy_name = ["Sword", "Sponge Bob Doll", "Sailormoon doll", "Princess doll", "Mini race car", "wig"]

10.times do
  Toy.create!(user:users.sample, name:toy_name.sample, category:rand(0..1), dates_available:Date.today, price:rand(10..1000), photo_url:"https://live.staticflickr.com/4023/4435779081_6b91100dcd_k.jpg")
end

puts "created #{Toy.count} toys. :) and users."
