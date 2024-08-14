json.extract! post_link, :id, :link_url, :post_id, :created_at, :updated_at
json.url post_link_url(post_link, format: :json)
