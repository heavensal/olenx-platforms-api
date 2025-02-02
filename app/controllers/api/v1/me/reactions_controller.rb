class Api::V1::Me::ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :upsert_reaction, only: [ :create, :update ]

  def create
    if @reaction.save
      render json: @reaction, status: :created
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reaction.update(reaction_params)
      render :show, status: :ok
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reaction = current_user.reactions.find(params[:id])
    if @reaction.destroy
      head :no_content
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reaction_type, :idea_id)
  end

  def upsert_reaction
    @reaction = current_user.reactions.find_or_initialize_by(idea_id: reaction_params[:idea_id])
    @reaction.reaction_type = reaction_params[:reaction_type]
    @reaction.user = current_user
  end
end
