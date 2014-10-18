# == Schema Information
#
# Table name: bounds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bound do
    sequence(:name) { |n| "地点#{n}" }
  end
end
