# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             company: true
             )

User.create!(name: "david",
			email: "d@v.id",
			password: "foobar",
			password_confirmation: "foobar",
			company: false
			)

Cposting.create!(content: "RAILING RAILS OFF OF RAILS",
				 user_id: 1,
				 spots: 3
	)