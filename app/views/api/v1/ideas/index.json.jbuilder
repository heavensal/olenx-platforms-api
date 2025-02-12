json.array! @ideas do |idea|
  json.id idea.id
  json.title idea.title
  json.description idea.description
  json.updated_at idea.updated_at
  json.likes idea.likes_count
  json.dislikes idea.dislikes_count
  json.user do
    json.id idea.user.id
    json.email idea.user.email
  end

  if @current_user
    reaction = idea.reactions.find_by(user_id: current_user.id)

    json.me do
      if reaction
        json.reaction_type reaction.reaction_type
      else
        json.reaction_type nil
      end
    end
  end

end
