json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :name, :introduction, :image_url, :group_id
  json.url admin_achievement_url(achievement, format: :json)
end
