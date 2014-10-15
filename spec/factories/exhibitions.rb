# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  introduction :string(255)
#  image_url    :string(255)
#  group_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  bound_id     :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exhibition do
    name { Faker::Name.title }
    introduction { Faker::Lorem.paragraph }
    group
    bound
  end
end
