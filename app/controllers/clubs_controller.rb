class ClubsController < ApplicationController

    def new

    end

    def create

    end

    def index 

    end

    def edit

    end

    def update

    end

    def show
        @club = Club.find_by(id: params[:id])
    end

    def delete

    end

end
