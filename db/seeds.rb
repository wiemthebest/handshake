# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'fr'


Ad.destroy_all
20.times do
    User.create!(first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             email: Faker::Internet.email,
                             password: Faker::Internet.password,
                             phone: Faker::PhoneNumber.phone_number,
                             address: Faker::Address.street_address,
                             zip_code: Faker::Address.zip_code,
                             date_of_birth: Faker::Date.birthday)
end
p "users create !"

15.times do
    Ad.create!(category: Faker::Team.state,
                         title: Faker::Lorem.paragraph_by_chars(number: rand(5..14)),
                         description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
                         phone: Faker::PhoneNumber.phone_number,
                         adress: Faker::Address.street_address,
                         zip_code: Faker::Address.zip_code,
                         date: Faker::Date.forward(days: 23)
    )
end
p "ads create !"
                                    
p "seed create !"
