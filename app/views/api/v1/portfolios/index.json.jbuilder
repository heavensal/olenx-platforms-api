json.array! @portfolios do |portfolio|
  json.id portfolio.id
  json.company_name portfolio.company_name
  json.description portfolio.description
  json.avatar portfolio.avatar
  json.user_id portfolio.user_id
end
