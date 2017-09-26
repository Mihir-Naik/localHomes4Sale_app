class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]
  
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Please provide all required fields."
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@current_user), flash: {danger: "Access Denied"}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    if @current_user.destroy
      session[:user_id] = nil
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone, :address, :email, :password, :password_confirmation)
  end
end
