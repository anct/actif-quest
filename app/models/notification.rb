# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Notification < ActiveRecord::Base
  # TODO: 投稿者（admin）アカウントとの紐付けは不要？
  # TODO: 本文の長さに関するvalidationの検討
  validates :content, presence: true
end
