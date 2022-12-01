json.extract! my_search, :id, :body, :user_id, :created_at, :updated_at
json.url my_search_url(my_search, format: :json)
