# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    uid { Faker::Number.number(8) }
    provider "facebook"
    token { Faker::Internet.password }
    expires_at "2014-09-07 05:07:04"
  end
end
