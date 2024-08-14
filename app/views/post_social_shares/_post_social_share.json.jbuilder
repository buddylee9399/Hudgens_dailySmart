json.extract! post_social_share, :id, :post_id, :provider, :created_at, :updated_at
json.url post_social_share_url(post_social_share, format: :json)
