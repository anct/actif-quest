# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  introduction :string(255)
#  image_url    :string(255)
#  group_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Exhibition < ActiveRecord::Base

  belongs_to :group
  has_many :votes, as: :votable
  has_many :voted_users, class_name: User.name, through: :votes

  validates :name, presence: true
  validates :introduction, presence: true
  validates :group_id, presence: true

  mount_uploader :image_url, ExhibitionUploader
end
