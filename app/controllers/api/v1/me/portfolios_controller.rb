class Api::V1::Me::PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [ :show, :update ]
  before_action :authenticate_user!

  def show
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
    @portfolio = current_user.portfolio.includes(:projects, :ideas).with_attached_avatar.with_attached_qr_code
  end

  def portfolio_params
    params.require(:portfolio).permit(:company_name, :description, :avatar)
  end
end
