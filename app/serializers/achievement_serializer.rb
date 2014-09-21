class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :name, :condition, :description, :icon

  def icon
  	object.icon_url.url
  end
end
