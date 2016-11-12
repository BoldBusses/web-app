json.extract! ridership, :id, :student_id, :route_id, :pickup_time, :created_at, :updated_at
json.url ridership_url(ridership, format: :json)