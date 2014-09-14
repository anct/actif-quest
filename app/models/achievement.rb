class Achievement < ActiveRecord::Base
	mount_uploader :icon_url, AchievementUploader
  # validates :name, presence: true
  # validates :condition, presence: true
  # validates :description, presence: true
end
