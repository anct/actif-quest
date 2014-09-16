json.array!(@users) do |user|
  json.extract! user, :id, :name
  json.url admin_user_url(user, format: :json)
end
