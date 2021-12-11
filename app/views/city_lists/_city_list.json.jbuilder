json.extract! city_list, :id, :city_id, :user_id, :created_at, :updated_at
json.url city_list_url(city_list, format: :json)
