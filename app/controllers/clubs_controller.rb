class ClubsController < ApplicationController

    def new
        redirect_if_not_logged_in
        @club = Club.new
        @book = Book.new
    end

    def create
        redirect_if_not_logged_in
        @club = Club.new(club_params)
        @club.club_users.build(user_id: current_user.id, admin: true)
    
        if @club.save
            redirect_to club_path(@club)
        else
            render new_club_path
        end
    end

    def index 
        redirect_if_not_logged_in
        @clubs = Club.all
    end

    def edit
        redirect_if_not_logged_in
        @club = Club.find_by(id: params[:id])
    end

    def your_clubs
        redirect_if_not_logged_in
        @clubs = current_user.clubs
    end

    def update
        redirect_if_not_logged_in
        @club = Club.find_by(id: params[:id])
        @club.update(club_params)
        redirect_to club_path(@club)
    end

    def show
        redirect_if_not_logged_in
        @club = Club.find_by(id: params[:id])
        @clubuser = ClubUser.new
    end

    def destroy
        redirect_if_not_logged_in
        @club = Club.find_by(id: params[:id])
        @club.destroy if current_user.clubs.include?(@club)
        redirect_to clubs_path
    end

    private 

    def club_params
        params.require(:club).permit(:name, :meeting_day, :zoom_link, book_attributes: [:name, :author])
    end

end
