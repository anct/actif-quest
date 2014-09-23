# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  uuid       :string(255)
#  minor      :integer
#  major      :integer
#  latitude   :float
#  longitude  :float
#  floor      :integer
#  bound_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid "MyString"
    minor 1
    major 1
    latitude 1.5
    longitude 1.5
    floor 1
    bound_id 1
  end
end
