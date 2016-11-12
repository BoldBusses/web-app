json.extract! trip, :id, :route_id, :start_at, :ended_at, :created_at, :updated_at
json.url trip_url(trip, format: :json)