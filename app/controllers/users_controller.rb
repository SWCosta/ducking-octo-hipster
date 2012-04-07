class UsersController < ApplicationController
  def index
    flash.now[:alert] = "ich teste was"
    @users = User.order(:email).page(params[:page]).per_page(5)
  end

  def new
    @user = User.new
  end
end
