class AddCaptainToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :captain_name, :string
    add_column :places, :captain_message_title, :string
    add_column :places, :captain_message, :string
    add_column :places, :captain_thumbnail_uid, :string
    add_column :places, :message, :text
  end
end
