class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.boolean :enable, default: false, null: false
      t.belongs_to :menu_category
      t.string :name
      t.integer :amount, default: 0, null: false
      t.text :content
      t.text :memo

      t.timestamps
    end
  end
end
