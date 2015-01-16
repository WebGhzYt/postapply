# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: "engrohitjain5@gmail.com",
             password:              "rohitrohit",
             password_confirmation: "rohitrohit",
             roles: true,
             admin: true)

User.create!(email: "user@user.com",
             password:              "user@user.com",
             password_confirmation: "user@user.com",
             roles: false,
             admin: false)
User.create!(email: "emp@emp.com",
             password:              "emp@emp.com",
             password_confirmation: "emp@emp.com",
             roles: true,
             admin: false)

99.times do |n|
  
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
              password:              password,
              password_confirmation: password,
              roles: false,
              admin: false,
              confirmed_at: Time.zone.now)
end

Post.create!(title: "Ruby On Rails",
  experience: 8,
  salary: 21352,
  post: "developer",
  user_id: 1)

