class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.belongs_to :store, foreign_key: true, index: true
      t.boolean :enable, default: false, null: false
      t.string :name
      t.integer :position
      t.text :lead
      t.text :content

      t.timestamps
    end
  end
end
