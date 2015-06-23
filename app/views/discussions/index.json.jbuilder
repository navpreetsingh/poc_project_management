json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :content, :user
  json.url discussion_url(discussion, format: :json)
end
