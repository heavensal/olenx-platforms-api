class Api::V1::Me::PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [ :update ]

  def show
    @portfolio = @current_user.portfolio
  end

  def update
    if @portfolio.update(portfolio_params)
      render :show, status: :ok
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  private

  def set_portfolio
    @portfolio = @current_user.portfolio
  end

  def portfolio_params
    params.require(:portfolio).permit(:company_name, :description, :avatar)
  end
end
