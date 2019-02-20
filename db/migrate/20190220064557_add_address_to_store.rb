class AddAddressToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :latitude, :string #緯度
    add_column :stores, :longitude, :string #経度
    add_column :stores, :near_station, :text
    add_column :stores, :region, :string
    add_column :stores, :locality, :string
    remove_column :stores, :city, :string
  end
end
