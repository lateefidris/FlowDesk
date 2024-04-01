json.extract! service, :id, :name, :description, :price, :time_in_minutes, :category_id, :created_at, :updated_at
json.url service_url(service, format: :json)
