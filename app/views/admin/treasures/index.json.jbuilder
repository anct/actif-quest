json.array!(@treasures) do |treasure|
  json.extract! treasure, :id, :name, :description, :image_url, :bound_id, :created_at, :updated_at
  json.url admin_treasure_url(treasure, format: :json)
end
