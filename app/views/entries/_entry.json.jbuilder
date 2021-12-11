json.extract! entry, :id, :creator_id, :neighborhood, :citylist_id,
              :geo_location, :category_id, :journal, :status, :created_at, :updated_at
json.url entry_url(entry, format: :json)
