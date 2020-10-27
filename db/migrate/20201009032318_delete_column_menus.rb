class DeleteColumnMenus < ActiveRecord::Migration[5.0]
  def up
    remove_index :menus, [:store_id, :enable, :menu_category_id]
    remove_column :menus, :store_id
    remove_column :menus, :amount
    add_index :menus, [:enable, :menu_category_id]
  end
  def down
    remove_index :menus, [:enable, :menu_category_id]
    add_column :menus, :amount, :integer, default: 0, null:false
    add_column :menus, :store_id, :integer
    add_index :menus, [:store_id, :enable, :menu_category_id]
  end
end
