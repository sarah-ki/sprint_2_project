class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def approve_user
    @user = User.find(params[:id])
    @users = User.all
    @user.approved = true
    if @user.save
      flash[:notice] = "User has been approved"
    else
      flash[:alert] = "There has been a problem approving this user."
    end
    redirect_to users_path
  end

  def disapprove_user
    @user = User.find(params[:id])
    @users = User.all
    @user.approved = false
    if @user.save
      flash[:notice] = "User has been disapproved"
    else
      flash[:alert] = "There has been a problem disapproving this user."
    end
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:approved, :email)
  end

end
