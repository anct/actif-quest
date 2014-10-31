class TreasureSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image

  has_one :bound

  def image
    Hash[object.image_url.versions.map{ |key, image| [key, image.url] }]
  end
  
end
