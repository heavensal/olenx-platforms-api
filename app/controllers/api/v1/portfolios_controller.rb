class Api::V1::PortfoliosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @portfolios = Portfolio.all
    render json: @portfolios
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    render json: @portfolio
  end
end
