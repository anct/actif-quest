# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  condition   :string(255)
#  description :string(255)
#  icon_url    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Achievement < ActiveRecord::Base
  validates :name, presence: true
  validates :condition, presence: true
  validates :description, presence: true

  mount_uploader :icon_url, AchievementUploader
end
