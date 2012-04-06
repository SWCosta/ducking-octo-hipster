class UsersController < ApplicationController
  def index
    flash.now[:alert] = "ich teste was"
    @users = User.all
  end
end
