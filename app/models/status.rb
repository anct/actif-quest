# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

class Status < ActiveRecord::Base

	include Favorable

  belongs_to :user
  
  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :body, presence: true
end
