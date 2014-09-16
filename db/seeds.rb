# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

User.create!(
  name: 'test_user',
  screen_name: 'test'
)

Status.create!(
  user_id: '1',
  body: 'This is a test status.'
)