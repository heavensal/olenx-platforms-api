json.project do
  json.id @project.id
  json.title @project.title
  json.description @project.description
  json.updated_at @project.updated_at
  json.avatar @project.avatar.url
end

json.portfolio do
  json.id @project.portfolio.id
  json.company_name @project.portfolio.company_name
end

json.user do
  json.id @project.user.id
  json.email @project.user.email
end
