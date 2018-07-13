# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create!({:team_name => "fake team", :start_time => "09:30 PM", :end_time => "10:30 PM"})
User.create!({:email => "rl@gmail.com", :password => "111111", :password_confirmation => "111111",:admin =>true,:name => "fakeguy", :team_id => 1})
