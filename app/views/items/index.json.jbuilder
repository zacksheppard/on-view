json.array!(@items) do |item|
  json.extract! item, :id, :title, :artist_name, :object_date, :medium, :dimensions, :credit_line, :accession_number, :label, :image_url
  json.url item_url(item, format: :json)
end
