class ClubUsersController < ApplicationController

    def new
        redirect_if_not_logged_in
        @clubuser = ClubUser.new
    end

    def show
        redirect_if_not_logged_in
        @clubuser = ClubUser.new
    end

    def create
        redirect_if_not_logged_in
        @clubuser = ClubUser.create(club_user_params)
        @clubuser.save
        redirect_to club_path(Club.find_by(id: params[:club_user][:club_id]))
    end

    private

    def club_user_params
        params.require(:club_user).permit(:user_id, :club_id)
    end

end