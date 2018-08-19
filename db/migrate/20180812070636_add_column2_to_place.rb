class AddColumn2ToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :opened_on, :date
    add_column :places, :capacity, :integer
  end
end
