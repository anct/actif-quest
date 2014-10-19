# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  condition   :string(255)
#  description :string(255)
#  icon_url    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement do
    sequence(:name) { |n| "実績 その#{n}" }
    sequence(:condition) { |n| "ほげほげ#{n}したら取得できるで" }
    sequence(:description) { |n| "こころ#{'ぴょん'*(n%45)}" }
  end
end
