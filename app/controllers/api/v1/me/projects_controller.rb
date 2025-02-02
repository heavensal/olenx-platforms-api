class Api::V1::Me::ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.with_attached_avatar
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.user = current_user
    @project.portfolio = current_user.portfolio

    if @project.save
      render :show, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @project.update(project_params)
      render :show, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id]).with_attached_avatar
  end

  def project_params
    params.require(:project).permit(:title, :description, :avatar)
  end
end
