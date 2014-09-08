class Exhibition < ActiveRecord::Base
	belongs_to :Group
	mount_uploader :image_url, ExhibitionUploader
end
