# == Schema Information
#
# Table name: taken_treasures
#
#  id          :integer          not null, primary key
#  user_id     :string(255)
#  treasure_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taken_treasure do
    user_id "MyString"
    treasure_id 1
  end
end
