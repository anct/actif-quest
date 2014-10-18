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
    sequence(:name) { |n| "展示#{n}" }
    sequence(:introduction) { |n| "こころ#{'ぴょん'*n}" }
    group
    bound
  end
end
