# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'factory_girl'

User.delete_all(nil, hard: true)
Status.delete_all(nil, hard: true)
Group.delete_all(nil, hard: true)
Exhibition.delete_all(nil, hard: true)

puts 'Creating admin...'
if Rails.env.development?
  Admin.all.delete_all(nil, hard: true)
  FactoryGirl.create(:admin)
else
  if Admin.where(email: email).blank?
    Admin.create(
      email: 'masayuki@izumin.info',
      password: ENV['ADMIN_PASSWORD'] || 'password',
      password_confirmation: ENV['ADMIN_PASSWORD'] || 'password'
    )
  end
end

puts 'Creating users...'
users = FactoryGirl.create_list(:user, 30)

puts 'Creating identities...'
users.each do |user|
  user.identities << FactoryGirl.create(:identity)
end

puts 'Creating statuses...'
users.each do |user|
  30.times { |i| user.statuses.create!(body: Faker::Lorem.sentence) }
end

puts 'Creating bounds...'
bounds = FactoryGirl.create_list(:bound, 20)

puts 'Creating beacons...'
bounds.each do |bound|
  2.times do |i|
    bound.beacons << FactoryGirl.create(:beacon)
  end
end

puts 'Creating groups...'
groups = FactoryGirl.create_list(:group, 30)

puts 'Creating exhibitions...'
groups.each.with_index do |group, i|
  exhibition = FactoryGirl.create(:exhibition)
  group.exhibitions << exhibition
  bounds[i%bounds.size].exhibitions << exhibition
end

puts 'Creating achievements...'
groups = FactoryGirl.create_list(:achievement, 30)

puts 'Creating treasures...'
bounds.each do |bound|
  bound.treasures << FactoryGirl.create(:treasure)
end

puts 'Creating notifications...'
FactoryGirl.create_list(:notification, 20)
