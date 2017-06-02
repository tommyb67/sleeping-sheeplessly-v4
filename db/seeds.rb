# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |banner|
  Banner.create!(start_date: Date.today, end_date: Date.tomorrow, location: "Jumbotron 2", headline: "#{banner} Don't get shorn!", subcopy: "Sheeplessly sleep the night away", image: "D:/sleeping/images")
end


  puts "10 Banner requests have been created"
