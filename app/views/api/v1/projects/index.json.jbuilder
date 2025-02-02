json.array! @projects do |project|
  json.id project.id
  json.title project.title
  json.description project.description
  json.updated_at project.updated_at
  json.avatar project.avatar.url
end
