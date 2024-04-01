json.extract! booking, :id, :desk_id, :service_id, :client_name, :client_email, :appointment, :created_at, :updated_at
json.url booking_url(booking, format: :json)
