json.array!(@exhibitions) do |exhibition|
  json.extract! exhibition, :id, :name, :introduction, :image_url, :group_id
  json.url admin_exhibition_url(exhibition, format: :json)
end
