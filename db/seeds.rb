# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |n|
  User.create!(email: "user#{n}@example.com",
               password: 'User1234',
               password_confirmation: 'User1234')

  Car.create!(name: "Car#{n}",
               description: "This is Car ##{n}",
               nrc: rand(50_000..100_000),
               mrc: rand(1000..2000),
               purchase_type: n.even? ? :lease : :purchase)

  House.create!(name: "House#{n}",
               description: "This is House ##{n}",
               nrc: rand(50_000..100_000),
               mrc: rand(1000..20_000),
               purchase_type: n.even? ? :lease : :purchase)

  Book.create!(name: "Book#{n}",
               description: "This is Book ##{n}",
               nrc: rand(10..100))

  Lamp.create!(name: "Lamp#{n}",
               description: "This is Lamp ##{n}",
               nrc: rand(10..100))
end