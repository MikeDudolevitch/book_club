class AddTimetableToClubBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :club_books, :timetable, :string
  end
end
