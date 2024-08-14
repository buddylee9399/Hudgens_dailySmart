json.extract! social_connection, :id, :user_id, :provider, :uid, :created_at, :updated_at
json.url social_connection_url(social_connection, format: :json)
