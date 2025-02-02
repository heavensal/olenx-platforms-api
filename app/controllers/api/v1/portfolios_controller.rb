class Api::V1::PortfoliosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    params.permit(q: {})
    @q = Portfolio.ransack(params[:q])
    @portfolios = @q.result(distinct: true).includes(:user, :projects, :ideas).with_attached_qr_code
  end

  def show
    @portfolio = Portfolio.includes(:user, :projects, :ideas).with_attached_qr_code.find(params[:id])
  end
end
