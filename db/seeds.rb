# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning up users database...'
Profile.destroy_all
Bear.destroy_all
User.destroy_all
puts 'Database cleaned'

missato = User.create(email: "rmissato@gmail.com", password: "123456")
gaga = User.create(email: "ladygaga@gmail.com", password: "123456")
User.create(email: "beyonce@gmail.com", password: "123456")
User.create(email: "mariah@gmail.com", password: "123456")
User.create(email: "ariana@gmail.com", password: "123456")

Bear.create(name: "Dan", personality: "Techno Bear", description: "Your friends are never free to go clubbing with you (if you have any friend at all?) - and now you're experiencing severe FOMO. Dan the techno will never let you down when it comes to dancing. Actually he'll never let you stop dancing and rest again. Did I mention that he never gets rejected from Berghain? Book him now!", price: 500, user: gaga)
Bear.create(name: "Angry Bobby", personality: "Angry", description: "Need some tough love? Book a day with Angry Bear. He is SO angry 😡", price: 300, user: missato)

puts 'Database populated :)'
