json.extract! follower, :id, :sender_id, :receiver_id, :created_at, :updated_at
json.url follower_url(follower, format: :json)
