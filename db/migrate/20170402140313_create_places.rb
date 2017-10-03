class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.belongs_to :organization, index: true
      t.boolean :enable, null: false, default: false
      t.string :name
      t.string :key, index: true
      t.text :address
      t.string :tel
      t.string :fax
      t.text :message

      t.string :captain_name
      t.string :captain_message_title
      t.text :captain_message
      t.string :captain_thumbnail_uid

      t.integer :position, null: false, default: 99999

      t.timestamps
    end
  end
end
