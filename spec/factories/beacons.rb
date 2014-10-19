# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  uuid       :string(255)
#  minor      :integer
#  major      :integer
#  latitude   :float(53)
#  longitude  :float(53)
#  floor      :integer
#  bound_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid "379502e7-f178-4ba5-92e1-4d20f6c513df"
    sequence(:minor) { |n| '%05d' % n }
    sequence(:major) { |n| '%05d' % (n*2) }
    sequence(:latitude) { |n| 139.75550025701523 + n * 0.0001 }
    sequence(:longitude) { |n| 39.801878433658466 + n * 0.0001 }
    sequence(:floor) { |n| n % 3 + 1 }
    bound
  end
end
