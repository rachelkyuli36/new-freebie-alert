class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      session[:username] = user.username
      log_in user
      redirect_to events_path
      # redirect_to user
    else
      # Create an error message.
      flash[:warning] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
