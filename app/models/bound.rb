class Bound < ActiveRecord::Base

  has_many :beacons

  validates_presence_of :name
end
