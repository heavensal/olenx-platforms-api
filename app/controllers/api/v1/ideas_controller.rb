class Api::V1::IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_portfolio, only: [ :index, :show ]

  def index
    if @portfolio
      @ideas = @portfolio.ideas.with_attached_avatar
    else
      @ideas = Idea.all.with_attached_avatar
    end
  end

  def show
    @idea = @portfolio ? @portfolio.ideas.with_attached_avatar.find(params[:id]) : Idea.with_attached_avatar.find(params[:id])
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id]) if params[:portfolio_id]
  end
end
