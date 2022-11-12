class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:create, :new]

    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            message = "Invalid login!"
            redirect_to login_path, notice: message
        end
    end

end