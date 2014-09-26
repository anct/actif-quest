# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'factory_girl'
Dir[Rails.root.join('spec/factories/*.rb')].each {|f| require f }

Admin.all.delete_all(nil, hard: true)
User.delete_all(nil, hard: true)
Status.delete_all(nil, hard: true)
Group.delete_all(nil, hard: true)
Exhibition.delete_all(nil, hard: true)

puts 'Creating admin...'
Admin.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

puts 'Creating users...'
users = FactoryGirl.create_list(:user, 30)

puts 'Creating identities...'
users.each do |user|
  user.identities << FactoryGirl.create(:identity)
end

puts 'Creating statuses...'
users.each do |user|
  30.times { |i| user.statuses.create!(body: Faker::Lorem.paragraph) }
end

puts 'Creating groups...'
groups = (0...30).map do |i|
    Group.create!(name: "test_group#{i}")
  end

puts 'Creating exhibitions...'
groups.each do |group|
  2.times do |i|
    group.exhibitions.create!(
      name: "test_exhibition#{i}",
      introduction: "This is a test exhibition#{i}."
    )
  end
end
