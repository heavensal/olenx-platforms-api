class Api::V1::ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_portfolio, only: [ :index, :show ]

  def index
    params.permit(q: {})

    if @portfolio
      @projects = @portfolio.projects
    else
      @q = Project.ransack(params[:q])
      @projects = @q.result(distinct: true)
    end
  end

  def show
    @project = @portfolio ? @portfolio.projects.find(params[:id]) : Project.find(params[:id])
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id]) if params[:portfolio_id]
  end
end
