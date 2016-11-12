json.extract! route, :id, :name, :driver_id, :created_at, :updated_at
json.url route_url(route, format: :json)