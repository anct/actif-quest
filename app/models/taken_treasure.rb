class TakenTreasure < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :treasure
end
