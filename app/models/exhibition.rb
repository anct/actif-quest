class Exhibition < ActiveRecord::Base
  belongs_to :group

  validates :name, presence: true
  validates :introduction, presence: true
  validates :group_id, presence: true

  mount_uploader :image_url, ExhibitionUploader
end
