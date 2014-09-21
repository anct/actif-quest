class ExhibitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :introduction, :image

  has_one :group

  def image
    object.image_url.url
  end
end
