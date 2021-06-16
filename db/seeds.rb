# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'fr'

User.destroy_all
Ad.destroy_all
Formation.destroy_all
Inscription.destroy_all
Participation.destroy_all

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
						 title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
						 description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
						 phone: Faker::PhoneNumber.phone_number,
						 adress: Faker::Address.street_address,
						 zip_code: Faker::Address.zip_code,
						 date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'))
end
p "ads create !"

15.times do
  Formation.create!(title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
										description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
										start_date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'),
										end_date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'),
										localisation: Faker::Address.full_address)
end
p "formations create !"

15.times do
	Inscription.create!(user_id: rand(1...15),
										  formation_id: rand(1...15))
end
p "inscriptions create !"

15.times do	
	Participation.create!(status: Faker::Boolean.boolean,
												user_id: rand(1...15),
											  ad_id: rand(1...15))
end
p "participations create !"
p "seed create !"

