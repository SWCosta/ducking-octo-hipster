class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per_page(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "Erfolg"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, :notice => "Erfolg"
    else
      redirect_to users_path, :alert => "Misserfolg"
    end
  end
end
