class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to events_path
    # redirect_to user_path(@user)
  end

  # not implemented on our website
  # def show
  #   id = params[:id] 
  #   @user = User.find(id) 
  # end
  
  # def destroy
  #   @user = User.find(params[:username])
  #   @user.destroy
  #   flash[:notice] = "User '#{@user.username}' deleted."
  #   redirect_to login_path
  # end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end