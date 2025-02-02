json.array! @ideas do |idea|
  json.id idea.id
  json.title idea.title
  json.description idea.description
  json.updated_at idea.updated_at
  json.avatar idea.avatar.url
end
