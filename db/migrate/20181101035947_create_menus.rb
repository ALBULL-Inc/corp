class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.belongs_to :store, foreign_key: true
      t.boolean :enable, default: false, null: false
      t.belongs_to :menu_category
      t.string :name
      t.integer :amount, default: 0, null: false
      t.text :content
      t.text :memo

      t.timestamps
    end
    add_index :menus, [:store_id, :enable, :menu_category_id]
  end
end
