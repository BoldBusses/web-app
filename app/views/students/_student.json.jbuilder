json.extract! student, :id, :name, :street_address, :city, :state, :zipcode, :created_at, :updated_at
json.url student_url(student, format: :json)