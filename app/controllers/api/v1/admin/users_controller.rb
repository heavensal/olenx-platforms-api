class Api::V1::Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
