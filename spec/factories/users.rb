# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Internet.user_name
    screen_name Faker::Name.name
    image_url Faker::Internet.url
  end
end
