class StaticController < ApplicationController

    before_action :redirect_if_not_logged_in
    def home
        @clubs = Club.all
    end

end
