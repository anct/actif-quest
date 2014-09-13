# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {
      Faker::Config.locale = :en
      Faker::Internet.user_name(5..16).gsub(/\./, '')
    }
    screen_name {
      Faker::Config.locale = :ja
      Faker::Name.name
    }
    image_url {
      Faker::Config.locale = :en
      Faker::Internet.url
    }
  end
end
