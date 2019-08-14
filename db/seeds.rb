# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do 
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@yopmail.com"
	User.create(email: email, password: Faker::Internet.password,
description: Faker::Quote.most_interesting_man_in_the_world, first_name: first_name, last_name: last_name)
end


5.times do
	e = Event.new(start_date: Faker::Time.forward(days: 23).to_datetime,
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.words, price: rand(2..150), location: Faker::Address.city, organizer: User.all.sample)
	until e.save
		e = Event.new(start_date: Faker::Time.forward(days: 23),
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.words, price: rand(2..150), location: Faker::Address.city, organizer: User.all.sample)
	end
end

40.times do
	a = Attendance.new(user: User.all.sample, event: Event.all.sample)
	until a.save
		a = Attendance.new(user: User.all.sample, event: Event.all.sample)
	end
end