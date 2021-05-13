class SessionsController < ApplicationController


    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create 
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
       
        redirect_to root_path
       
        else
            flash[:alert] = "You did not login successfully"
            redirect_to login_path
        end
    end

    def omniauth
        access_token = request.env["omniauth.auth"]
        user = User.from_omniauth(access_token)
        session[:user_id] = user.id
        user.google_token = access_token.credentials.token
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        redirect_to root_path
         
    end

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private

    def auth 
        request.env['omniauth.auth']
    end


end
