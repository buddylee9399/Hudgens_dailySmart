json.extract! vote, :id, :choice, :post_id, :user_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
