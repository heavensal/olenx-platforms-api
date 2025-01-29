json.array! @portfolios do |portfolio|
  json.extract! portfolio, :id, :name, :description, :created_at, :updated_at, :user_id, :avatar, :qr_code
  json.portfolio_url api_v1_portfolio_url(portfolio, format: :json)
end
