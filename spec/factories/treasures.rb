# == Schema Information
#
# Table name: treasures
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image_url   :string(255)
#  bound_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :treasure do
    sequence(:name) { |n| "おたから#{n}" }
    sequence(:description) { |n| "こころがぴょんぴょんするおたから その#{n}" }
    bound
  end
end
