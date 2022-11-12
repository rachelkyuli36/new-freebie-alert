class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
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