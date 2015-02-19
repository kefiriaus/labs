json.array!(@notes) do |note|
  json.extract! note, :id, :active, :name, :code, :sort, :text
  json.url note_url(note, format: :json)
end
