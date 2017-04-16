json.extract! restaurant, :id, :name, :location, :up_vote, :down_vote, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
