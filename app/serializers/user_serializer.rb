class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :screen_name, :image

  def image
  	object.image_url.url
  end
end
