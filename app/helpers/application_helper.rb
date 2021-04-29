module ApplicationHelper

    def current_user 
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_already_logged_in
        redirect root_path if logged_in?
    end

    def redirect_if_not_logged_in
        redirect root_path if !logged_in?
    end
    
end
