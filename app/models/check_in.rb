# == Schema Information
#
# Table name: check_ins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  bound_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class CheckIn < ActiveRecord::Base

  belongs_to :bound
  
end
