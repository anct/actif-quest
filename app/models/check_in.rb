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
  belongs_to :user

  validates_presence_of :bound_id, :user_id
  validates_uniqueness_of :user_id, scope: :bound_id
end
