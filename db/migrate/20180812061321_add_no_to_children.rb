class AddNoToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :no, :integer
  end
end
