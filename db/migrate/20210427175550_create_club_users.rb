class CreateClubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :club_users do |t|
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end
  end
end
