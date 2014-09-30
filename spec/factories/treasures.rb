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
    name "MyString"
    description "MyString"
    image_url "MyString"
    bound_id 1
  end
end
