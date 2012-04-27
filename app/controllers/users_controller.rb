class UsersController < ApplicationController
  def index
    params[:page] = get_page_for_user(id) if params[:user_page]
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
  
  def edit
    @user = User.find(params[:id])
    if params[:transition] == "activate"
      render :activate and return
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:activate]
      @user.toggle!(:approved)
      RegistrationMailer.activated_email(@user).deliver
      redirect_to users_path(:page => params[:page]), :notice => "User aktiviert"
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
