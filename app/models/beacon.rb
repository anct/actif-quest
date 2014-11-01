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

class Beacon < ActiveRecord::Base

  belongs_to :bound

  validates_presence_of :uuid, :minor, :major, :bound_id
end
