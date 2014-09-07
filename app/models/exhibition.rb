class Exhibition < ActiveRecord::Base
	mount_uploader :image_url, ExhibitionUploader
end
