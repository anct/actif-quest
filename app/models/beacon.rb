class Beacon < ActiveRecord::Base

  belongs_to :bound

  validates_presence_of :uuid, :minor, :major, :latitude, :longitude, :floor, :bound_id
end
