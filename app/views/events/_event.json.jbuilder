json.extract! event, :id, :name, :description, :event_date, :location, :event_type, :created_at, :updated_at
json.url event_url(event, format: :json)
