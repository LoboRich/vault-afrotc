json.extract! attachment, :id, :vehicle_id, :franchise_id, :image, :filename, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
