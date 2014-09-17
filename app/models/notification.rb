class Notification < ActiveRecord::Base
	validates :content, presence: true
end
