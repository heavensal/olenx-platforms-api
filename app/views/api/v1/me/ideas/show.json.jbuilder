json.idea do

  json.id @idea.id
  json.title @idea.title
  json.description @idea.description
  json.updated_at @idea.updated_at
  json.avatar @idea.avatar.url
  json.reactions do
    json.likes @idea.likes_count
    json.dislikes @idea.dislikes_count
  end

  json.portfolio do
    json.id @idea.portfolio.id
    json.company_name @idea.portfolio.company_name
  end

  json.user do
    json.id @idea.user.id
    json.email @idea.user.email
  end

end
