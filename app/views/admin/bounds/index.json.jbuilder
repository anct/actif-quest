json.array!(@bounds) do |bound|
  json.extract! bound, :id, :name
  json.url admin_bound_url(bound, format: :json)
end
