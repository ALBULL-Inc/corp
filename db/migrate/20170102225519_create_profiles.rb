class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :account, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.integer :gender, default: 0, limit: 1
      t.integer :blood,  default: 0, limit: 1
      t.date :birthday

      t.timestamps
    end
  end
end
