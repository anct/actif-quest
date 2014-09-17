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
	validates :content, presence: true
end
