json.array!(@groups) do |group|
  json.extract! group, :id, :name
  json.url admin_group_url(group, format: :json)
end
