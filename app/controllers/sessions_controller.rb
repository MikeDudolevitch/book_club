class SessionsController < ApplicationController

    def new

    end

    def create 
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end
