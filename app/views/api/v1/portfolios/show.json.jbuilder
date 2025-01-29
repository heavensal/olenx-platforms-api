json.portfolio @portfolio do
  json.id @portfolio.id
  json.name @portfolio.name
  json.description @portfolio.description
  if @portfolio.qr_code.attached?
    json.qr_code @portfolio.qr_code.url
  # Add other portfolio attributes as needed
end

# json.projects @projects do |project|
#   json.id project.id
#   json.name project.name
#   json.description project.description
#   # Add other project attributes as needed
# end

# json.ideas @ideas do |idea|
#   json.id idea.id
#   json.name idea.name
#   json.description idea.description
#   # Add other idea attributes as needed
# end
