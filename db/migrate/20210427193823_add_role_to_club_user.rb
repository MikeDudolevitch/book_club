class AddRoleToClubUser < ActiveRecord::Migration[6.1]
  def change
    add_column :club_users, :admin, :boolean
  end
end
