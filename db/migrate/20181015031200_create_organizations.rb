class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.bigint :corporate_number, index: true, null: false, unique: true
      t.string :name

      t.timestamps
    end
  end
end
