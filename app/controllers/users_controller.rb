class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    rediect_to events_path
    # redirect_to user_path(@user)
  end

  def show
    id = params[:id] 
    @user = User.find(id) 
  end
  
  def destroy
    @user = User.find(params[:username])
    @user.destroy
    message = "Account '#{@user.id}' deleted."
    redirect_to login_path, notice: message
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end