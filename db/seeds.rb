# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Administrator",
             email: "maulanamania@gmail.com",
             password:              "t4jmahal",
             password_confirmation: "t4jmahal",
             admin: true)

User.create!(name:  "Arief Maulana",
             email: "maulanamania@zpost.plala.or.jp",
             password:              "t4jmahal",
             password_confirmation: "t4jmahal")

#99.times do |n|
#    name = Faker::Name.name
#    email = "example-#{n+1}@railstutorial.org"
#    password = "password"
#    User.create!(name:  name,
#                 email: email,
#                 password:              password,
#                 password_confirmation: password)
#end