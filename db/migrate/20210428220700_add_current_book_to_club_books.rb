class AddCurrentBookToClubBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :club_books, :is_current, :boolean
  end
end
