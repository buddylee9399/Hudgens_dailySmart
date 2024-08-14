json.extract! topic_following, :id, :topic_id, :user_id, :created_at, :updated_at
json.url topic_following_url(topic_following, format: :json)
