class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user
      flash[:warning] = 'Invalid email/password combination'
      render 'new'
    elsif user && user.authenticate(params[:session][:password]) && user.email_confirmed
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      session[:username] = user.username
      log_in user
      redirect_to events_path
      # redirect_to user
    elsif !user.email_confirmed
      # Create an error message.
      flash[:warning] = "Please activate your account by following the instructions in the account confirmation email you received to proceed"
      render 'new'
    # else
    #   flash[:warning] = 'Invalid email/password combination'
    #   render 'new'
    end
  end

  def destroy
  end
end
