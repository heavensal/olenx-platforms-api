class Api::V1::IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_portfolio, only: [ :index, :show ]

  def index
    params.permit(q: {})

    if @portfolio
      @ideas = @portfolio.ideas
    else
      @q = Idea.ransack(params[:q])
      @ideas = @q.result(distinct: true)
    end
  end

  def show
    @idea = @portfolio ? @portfolio.ideas.find(params[:id]) : Idea.find(params[:id])
    if @current_user
      @reaction = @idea.reactions.find_by(user_id: @current_user.id)
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id]) if params[:portfolio_id]
  end
end
