json.extract! user, :id, :name, :password, :type, :created_at, :updated_at
json.url user_url(user, format: :json)
