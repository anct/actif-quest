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

class TakenTreasure < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :treasure

  validates_uniqueness_of :user_id, scope: :treasure_id
end
