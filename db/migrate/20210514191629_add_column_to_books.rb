class AddColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :timetable, :string
  end
end
