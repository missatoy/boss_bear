# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning up users database...'
Profile.destroy_all
Booking.destroy_all
Bear.destroy_all
User.destroy_all
puts 'Database cleaned'

User.create(email: "rmissato@gmail.com", password: "123456")
User.create(email: "ladygaga@gmail.com", password: "123456")
User.create(email: "beyonce@gmail.com", password: "123456")
User.create(email: "mariah@gmail.com", password: "123456")
User.create(email: "ariana@gmail.com", password: "123456")
User.all.each { |user| user.create_profile }

puts 'Database populated :)'
