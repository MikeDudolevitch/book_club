class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to root_path 
            else
                render :new
        end
    end

    def index 
        @user = User.find_by(id: session[:user_id])
    end

    def edit
        @user = User.find_by(params[:username])
    end


    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end

end