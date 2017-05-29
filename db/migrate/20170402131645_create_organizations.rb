class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :address
      t.string :tel
      t.string :fax
      t.text :memo

      t.timestamps
    end
  end
end
