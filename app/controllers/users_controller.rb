class UsersController < ApplicationController
  def index
    flash.now[:alert] = "ich teste was"
    @users = User.all
  end

  def new
    @user = User.new
  end
end
