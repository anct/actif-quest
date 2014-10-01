# == Schema Information
#
# Table name: bounds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Bound < ActiveRecord::Base

  has_many :beacons
  has_many :check_ins
  has_many :exhibitions
  has_many :treasures

  validates_presence_of :name
end
