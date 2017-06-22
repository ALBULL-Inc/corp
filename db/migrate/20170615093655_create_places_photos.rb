class CreatePlacesPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :places_photos do |t|
      t.belongs_to :place, foreign_key: true
      t.belongs_to :photo, foreign_key: true

      t.timestamps
    end
  end
end
