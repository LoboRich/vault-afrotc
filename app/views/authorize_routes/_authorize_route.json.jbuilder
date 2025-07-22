json.extract! authorize_route, :id, :name, :route_type, :created_at, :updated_at
json.url authorize_route_url(authorize_route, format: :json)
