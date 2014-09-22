class StatusSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body

  has_one :user
end
