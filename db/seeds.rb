# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.all.delete_all(nil, hard: true)
User.delete_all(nil, hard: true)
Status.delete_all(nil, hard: true)
Group.delete_all(nil, hard: true)
Exhibition.delete_all(nil, hard: true)

Admin.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

users = (0...30).map do |i|
		User.create!(
 		 	name: "test_user#{i}",
  		screen_name: "テストユーザ#{i}"
		)
	end

users.each do |user|
	30.times do |i|
		user.statuses.create!(body: "This is a test status#{i}.")
	end
end

groups = (0...30).map do |i|
		Group.create!(name: "test_group#{i}")
end

groups.each do |group|
	2.times do |i|
		group.exhibitions.create!(
			name: "test_exhibition#{i}",
			introduction: "This is a test exhibition#{i}."
		)
	end
end