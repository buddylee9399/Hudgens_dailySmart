json.extract! topic, :id, :title, :slug, :deleted_at, :themes_count, :created_at, :updated_at
json.url topic_url(topic, format: :json)
