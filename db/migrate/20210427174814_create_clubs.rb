class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :meeting_day
      t.integer :number_of_members

      t.timestamps
    end
  end
end
