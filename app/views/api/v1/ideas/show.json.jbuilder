json.idea do
  json.id @idea.id
  json.title @idea.title
  json.description @idea.description
  json.user_id @idea.user_id
  json.updated_at @idea.updated_at

  json.reactions do
    json.likes @idea.likes_count
    json.dislikes @idea.dislikes_count
  end

  if @current_user
    json.me do
      json.reaction_type @reaction&.reaction_type
    end
  end

end
