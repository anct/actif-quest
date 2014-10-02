class TreasureSerializer < ActiveModel::Serializer
  attributes :id, :description, :image_url

  has_one :bound
  
end
