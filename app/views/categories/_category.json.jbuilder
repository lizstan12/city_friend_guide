json.extract! category, :id, :art_design, :food, :historical, :created_at,
              :updated_at
json.url category_url(category, format: :json)
