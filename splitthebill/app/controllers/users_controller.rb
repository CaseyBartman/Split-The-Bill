class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user  #Use current_user instead of User.find(params[:id])!
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
