class AddColumnToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :let, :string
    add_column :places, :lng, :string
    add_column :places, :gmap_url, :string
  end
end
