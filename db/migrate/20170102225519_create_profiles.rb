class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.bigint :profileable_id
      t.string :profileable_type
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.integer :gender, default: 0, limit: 1
      t.integer :blood,  default: 0, limit: 1
      t.date :birthday

      t.timestamps
    end
    add_index :profiles, [:profileable_type, :profileable_id]
  end
end
