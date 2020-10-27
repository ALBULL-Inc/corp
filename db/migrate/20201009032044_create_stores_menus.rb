class CreateStoresMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :stores_menus do |t|
      t.belongs_to :menu, foreign_key: true
      t.belongs_to :store, foreign_key: true
      t.integer :amount, default: 0, null: false

      t.timestamps
    end
  end
end
