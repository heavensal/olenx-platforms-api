class Api::V1::Me::IdeasController < ApplicationController
  before_action :set_idea, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @ideas = current_user.ideas.with_attached_avatar
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    @idea.portfolio = current_user.portfolio
    @idea.user = current_user

    if @idea.save
      render :show, status: :created
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @idea.update(idea_params)
      render :show, status: :ok
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @idea.destroy
    head :no_content
  end

  private

  def set_idea
    @idea = current_user.ideas.find(params[:id]).with_attached_avatar
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :avatar)
  end
end
