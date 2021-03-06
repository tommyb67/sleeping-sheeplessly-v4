# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Bill", last_name: "Bixby")

puts "1 User created"

AdminUser .create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Bixby")

puts "1 Admin User created"

30.times do |banner|
  Banner.create!(start_date: Date.today, end_date: Date.tomorrow, location: "Jumbotron 2", headline: "#{banner} Don't get shorn!", subcopy: "Sheeplessly sleep the night away", image: "D:/sleeping/images", user_id: @user.id)
end


  puts "30 Banner requests have been created"
