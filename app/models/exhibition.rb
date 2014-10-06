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
#  bound_id     :integer
#

class Exhibition < ActiveRecord::Base

  include Votable

  belongs_to :bound
  belongs_to :group

  validates :name, presence: true
  validates :introduction, presence: true
  validates :group_id, presence: true

  mount_uploader :image_url, ExhibitionUploader
end
