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
      UserMailer.registration_confirmation(@user).deliver
      # flash[:notice] = "Login with your new account!"
      flash[:notice] = "Please confirm your email address to continue"
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

  def confirm_email
    user = User.find_by_confirm_token(user_params[:email])
    if user
      user.email_activate
      flash[:notice] = "Welcome to FreebieAlert! Your email has been confirmed. Please sign in to continue."
      redirect_to login
    else
      flash[:warning] = "Sorry. User does not exist"
      redirect_to login
    end
end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end