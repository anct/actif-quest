# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    Faker::Config.locale = :en
    name Faker::Internet.user_name(5..16).gsub(/\./, '')
    screen_name {
      Faker::Config.locale = :ja
      Faker::Name.name
    }
    image_url Faker::Internet.url
  end
end
