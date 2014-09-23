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

require 'rails_helper'

RSpec.describe Beacon, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
