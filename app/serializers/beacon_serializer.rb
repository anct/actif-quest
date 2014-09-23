class BeaconSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :minor, :major, :latitude, :longitude, :floor, :bound_id

  has_one :bound
end
