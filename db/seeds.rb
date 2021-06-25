# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include UsersHelper
Faker::Config.locale = 'fr'

Category.destroy_all
User.destroy_all
Ad.destroy_all
Formation.destroy_all
Inscription.destroy_all
Participation.destroy_all

Category.create(title: "Accompagnement social")
Category.create(title: "Tâches ménagères")
Category.create(title: "Déplacements médicaux")
Category.create(title: "Déplacements")
Category.create(title: "Lecture")
Category.create(title: "Petits Travaux")

p "Catégories créer"

10.times do
	User.create!(first_name: Faker::Name.first_name,
							 last_name: Faker::Name.last_name,
							 email: Faker::Internet.email,
							 password: Faker::Internet.password,
							 phone: Faker::PhoneNumber.phone_number,
							 address: Faker::Address.street_address,
							 zip_code: Faker::Address.zip_code,
							 city: city_list.sample[1],
							 date_of_birth: Faker::Date.birthday,
							 classification: options_for_classification.sample[1]
							 
							)
end
p "users create !"

9.times do
	Ad.create!(category: Faker::Team.state,
						 title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
						 description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
						 phone: Faker::PhoneNumber.phone_number,
						 adress: Faker::Address.street_address,
						 zip_code: Faker::Address.zip_code,
						 city: city_list.sample[1],
						 date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'),
						 user: User.find(rand(1...10)),
						 classification: User.find(rand(1...10)).classification
	)
end
p "ads create !"

10.times do
  Formation.create!(title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
										description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
										start_date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'),
										end_date: Faker::Date.between(from: '2021-06-16', to: '2023-06-16'),
										localisation: Faker::Address.full_address)
end
p "formations create !"

10.times do
	Inscription.create!(user_id: rand(1...10),
										  formation_id: rand(1...10))
end
p "inscriptions create !"

10.times do	
	Participation.create!(status: Faker::Boolean.boolean,
												user_id: rand(1...10),
											  ad_id: rand(1...10))
end
p "participations create !"
p "seed create !"

