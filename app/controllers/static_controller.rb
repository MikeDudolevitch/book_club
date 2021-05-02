class StaticController < ApplicationController

    def home
        @clubs = Club.all
    end

end
