json.array!(@notifications) do |notification|
  json.extract! notification, :content
  json.url admin_notification_url(notification, format: :json)
end
