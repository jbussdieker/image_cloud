json.array!(@images) do |image|
  json.extract! image, :id, :name, :taken_at, :longitude, :latitude
  json.url image_url(image, format: :json)
end
