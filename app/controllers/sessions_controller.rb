class SessionsController < ApplicationController


    def new
    
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
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
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
