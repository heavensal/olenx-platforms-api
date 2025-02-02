class Api::V1::PortfoliosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @portfolios = Portfolio.with_attached_avatar.all
  end

  def show
    @portfolio = Portfolio.includes(:user, :projects, :ideas).with_attached_qr_code.find(params[:id])
  end
end
