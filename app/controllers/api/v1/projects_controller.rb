class Api::V1::ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_portfolio, only: [ :index, :show ]

  def index
    if @portfolio
      @projects = @portfolio.projects.with_attached_avatar
    else
      @projects = Project.all.with_attached_avatar
    end
  end

  def show
    @project = @portfolio ? @portfolio.projects.with_attached_avatar.find(params[:id]) : Project.with_attached_avatar.find(params[:id])
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id]) if params[:portfolio_id]
  end
end
