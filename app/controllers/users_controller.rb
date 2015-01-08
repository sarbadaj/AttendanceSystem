class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = User.new
  end

  def index
    @users = current_user.company.users
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.admin = params[:user][:admin]
    if @user.save
      flash[:notice] = "Role of #{@user.email} has been changed."
      redirect_to users_path
    else
      flash[:notice] = "Role of #{@user.email} has not been changed."
      redirect_to users_path
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to users_path
  end
end
