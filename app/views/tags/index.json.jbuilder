json.array!(@tags) do |tag|
  json.extract! tag, :id, :active, :sort, :name, :code
  json.url tag_url(tag, format: :json)
end
