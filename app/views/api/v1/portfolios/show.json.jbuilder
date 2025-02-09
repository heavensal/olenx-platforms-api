json.portfolio do

  json.id @portfolio.id
  json.company_name @portfolio.company_name
  json.description @portfolio.description
  json.avatar @portfolio.avatar
  json.qr_code @portfolio.qr_code.url

  json.user do
    json.id @portfolio.user.id
    json.email @portfolio.user.email
  end

  json.projects @portfolio.projects do |project|
    json.id project.id
    json.title project.title
    json.description project.description
    json.updated_at project.updated_at
    json.avatar project.avatar
  end

  json.ideas @portfolio.ideas do |idea|
    json.id idea.id
    json.title idea.title
    json.description idea.description
    json.updated_at idea.updated_at
    json.avatar idea.avatar
  end

end
