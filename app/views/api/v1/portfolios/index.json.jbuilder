json.array! @portfolios do |portfolio|
  json.extract! portfolio, :id, :name, :description, :created_at, :updated_at
end
