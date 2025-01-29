json.portfolio do
  json.id @portfolio.id
  json.company_name @portfolio.company_name
  json.description @portfolio.description
  json.qr_code cloudinary_url(@portfolio.qr_code.key)


  json.user do
    json.id @portfolio.user.id
    json.email @portfolio.user.email
  end
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
