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

require 'rails_helper'

RSpec.describe TakenTreasure, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
