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
    name "MyString"
    condition "MyString"
    description "MyString"
    icon_url "MyString"
  end
end
