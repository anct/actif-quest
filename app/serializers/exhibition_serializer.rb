class ExhibitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :introduction, :image

  has_one :group

  def image
    Hash[object.image_url.versions.map{ |key, image| [key, image.url] }]
  end
end
