# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exhibition do
    name { Faker::Company.name }
    introduction { Faker::Lorem.paragraph }
    group { create :group }
  end
end
