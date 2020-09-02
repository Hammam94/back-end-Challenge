# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Role.create!([
  { name: 'driver' },
  { name: 'passenger' }
])

1000000.times do |i|
  User.create!({
    email: Faker::Internet.unique.email,
    name: Faker::Name.unique.name,
    password: "12345678",
    password_confirmation: "12345678",
    role_id: 1
  })
end

2000000.times do |i|
  Trip.create!({
    trip_date: Faker::Date.backward(2),
    user_id: Faker::Date.backward(from: 1, to: 40)
  })
end
