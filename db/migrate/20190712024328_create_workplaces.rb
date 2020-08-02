class CreateWorkplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workplaces do |t|
      t.belongs_to :organization, foreign_key: true, index: true
      t.boolean :enable, defalt: true, null: false
      t.string :name
      t.integer :postcode
      t.string :region
      t.string :locality
      t.string :address
      t.string :building
      t.integer :tel
      t.integer :fax
      t.string :gmap_query
      t.string :latitude
      t.string :longitude
      t.integer :date_change_hour
      t.string :position, index: true

      t.timestamps
    end
  end
end
