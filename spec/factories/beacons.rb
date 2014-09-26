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
    uuid "379502e7-f178-4ba5-92e1-4d20f6c513df"
    minor { Faker::Number.number(5) }
    major { Faker::Number.number(5) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    floor { Faker::Number.digit }
    bound
  end
end
