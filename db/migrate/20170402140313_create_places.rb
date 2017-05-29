class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.belongs_to :organization, index: true
      t.string :name
      t.string :key, index: true
      t.text :address
      t.string :tel
      t.string :fax

      t.timestamps
    end
  end
end
