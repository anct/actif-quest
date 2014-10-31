class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :screen_name, :image

  def image
    Hash[object.image_url.versions.map{ |key, image| [key, image.url] }]
  end
end
