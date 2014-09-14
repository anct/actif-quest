json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :introduction, :image_url, :group_id
  json.url admin_admin_url(admin, format: :json)
end
