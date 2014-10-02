class TreasureSerializer < ActiveModel::Serializer
  attributes :id, :description, :image_url, :bound_id

  has_one :bound
  
end
