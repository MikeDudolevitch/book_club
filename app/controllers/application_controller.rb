class ApplicationController < ActionController::Base
    enable :sessions
    set :session_secret, ENV['SECRET']

    helpers do
        
        def current_user 
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_already_logged_in
            redirect "/guitars" if logged_in?
        end

        def redirect_if_not_logged_in
            redirect '/login' if !logged_in?
        end

    end 

end
