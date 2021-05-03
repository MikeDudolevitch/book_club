class ClubsController < ApplicationController

    def new
        @club = Club.new
    end

    def create
        @club = Club.new(club_params)
        if @club.save
            redirect_to club_path(@club)
        else
            render new_club_path
        end
    end

    def index 
        @clubs = Club.all
    end

    def edit

    end

    def update

    end

    def show
        @club = Club.find_by(id: params[:id])
        @clubuser = ClubUser.new
    end

    def delete

    end

    private 

    def club_params
        params.require(:club).permit(:name, :meeting_day, :zoom_link, book_attributes: [:name, :author])
    end

end
