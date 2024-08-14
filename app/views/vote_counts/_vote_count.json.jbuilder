json.extract! vote_count, :id, :number_of_votes, :post_id, :created_at, :updated_at
json.url vote_count_url(vote_count, format: :json)
