class AddZoomLinkToClub < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :zoom_link, :string
  end
end
