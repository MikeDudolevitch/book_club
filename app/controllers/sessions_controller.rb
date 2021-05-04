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
            render :new
        end
    end

    def omniauth
        # in with oauth
        # # if that user has already logged in this way
        # user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
        #     u.email = request.env['omniauth.auth'][:info][:email]
        #     u.password = SecureRandom.hex(15)
        #     u.username = request.env['omniauth.auth'][:info][:first_name]
        # end

        # # check that they register successful
        # if user.valid? 
        #     session[:user_id] = user.id   #log them in
        #     redirect_to user_path(user)
        # else
        #     flash[:message] = "Oh snap! Something's wrong!"
        #     redirect_to login_path
        # end
        # 
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
        session.clear
        redirect_to root_path
    end

    private

    def auth 
        request.env['omniauth.auth']
    end


end
