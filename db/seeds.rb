# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |user|
	name = Faker::Name.name
	email = "example-comp#{user+1}@railstutorial.org"
	password = "password"
	User.create!(name: name, 
				email: email,
				password: password,
				password_confirmation: password,
				company: true)
end

40.times do |user|
	name = Faker::Name.name
	email = "example-cust#{user+1}@railstutorial.org"
	password = "password"
	User.create!(name: name,
				email: email,
				password: password,
				password_confirmation: password)
end


6.times do |spots|
	title = "FUN STUFF NUMBER #{spots+1}" 
	content = Faker::Lorem.sentence
	user_id = spots+1 
	spots = spots+1 
	Cposting.create!(title: title,
					content: content,
					user_id: user_id,
					spots: spots)
end



Cposting.all.each do |n|
	users = User.all
	subscribers = users[6..5+n.spots]
		subscribers.each { |sub| Subscription.where(post: n.id, subscriber: sub.id).create}		 
	end

User.create!(name: "david",
			email: "d@v.id",
			password: "foobar",
			password_confirmation: "foobar",
			company: false
			)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             company: true
             )
Cposting.create!(content: "NOT BOOKED FULL (yet)",
				spots: 1,
				user_id: 47) #example user

