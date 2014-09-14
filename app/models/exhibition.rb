class Exhibition < ActiveRecord::Base
  belongs_to :Group
  mount_uploader :image_url, ExhibitionUploader
  validates :name, presence: true
  validates :introduction, presence: true
  validates :group_id, presence: true
end
