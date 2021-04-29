class SessionsController < ApplicationController

    def create 
        session[:current_user_id] = @user.id
    end

    def delete
        session.destroy
    end

end
