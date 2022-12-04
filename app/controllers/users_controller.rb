class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # session[:user_id] = @user.id
    if User.find_by(email: user_params[:email])
      flash[:warning] = "Email is already associated with another account. Please try creating another account."
    
    elsif User.find_by(username: user_params[:username])
      flash[:warning] = "Username is already associated with another account. Please try creating another account."

    elsif !("@columbia.edu".in? user_params[:email]) && !("@barnard.edu".in? user_params[:email])
      flash[:warning] = "Email is not valid. Please try creating another account with a columbia/barnard email."
    else
      @user = User.create(user_params)
      flash[:notice] = "Login with your new account!"
    end
    redirect_to login_path
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