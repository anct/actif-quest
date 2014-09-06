class Exhibition < ActiveRecord::Base
	mount_uploader :image, ExhibitionUploader
end
