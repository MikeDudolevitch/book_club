class ClubUsersController < ApplicationController

    before_action :redirect_if_not_logged_in
    
    def new
        @clubuser = ClubUser.new
    end

    def show
        @clubuser = ClubUser.new
    end

    def create
        @clubuser = ClubUser.create(club_user_params)
        @clubuser.save
        redirect_to club_path(Club.find_by(id: params[:club_user][:club_id]))
    end

    private

    def club_user_params
        params.require(:club_user).permit(:user_id, :club_id)
    end

end