class AddColumnsToRecruit < ActiveRecord::Migration[5.0]
  def change
    add_column :recruits, :portrait_uid, :string
    add_column :recruits, :employment_type, :integer
  end
end
