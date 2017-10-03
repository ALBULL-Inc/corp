class AddColumnsToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :enable, :boolean, default: false, null: false
    add_column :places, :position, :integer, default: 99999, null: false
  end
end
