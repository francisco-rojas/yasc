5.times do |n|
  n += 1
  User.create!(email: "user#{n}@example.com",
               password: 'User1234',
               password_confirmation: 'User1234')

  b = Building.create!(name: "Building ##{Faker::Address.building_number}",
                       address: "#{Faker::Address.city}, #{Faker::Address.street_name}")

  3.times do |i|
    i += 1
    b.floors.create(number: i)
  end

  Chair.create!(model: Faker::Commerce.product_name,
                description: Faker::Lorem.paragraph,
                nrc: Faker::Commerce.price)

  Cubicle.create!(height: Faker::Number.number(1),
                  area: Faker::Number.number(2),
                  description: Faker::Lorem.paragraph,
                  mrc: Faker::Commerce.price,
                  nrc: Faker::Commerce.price)

end
