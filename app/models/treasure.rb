# == Schema Information
#
# Table name: treasures
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image_url   :string(255)
#  bound_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Treasure < ActiveRecord::Base
  
  belongs_to :bound

  has_many :taken_treasures
  
end
