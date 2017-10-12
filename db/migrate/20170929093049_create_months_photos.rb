class CreateMonthsPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :months_photos do |t|
      t.belongs_to :month, foreign_key: true
      t.belongs_to :photo, foreign_key: true

      t.timestamps
    end
  end
end
