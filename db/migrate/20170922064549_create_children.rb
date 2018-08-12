class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.belongs_to :family, foreign_key: true
      t.belongs_to :place, foreign_key: true
      t.integer :no
      t.string :first_name
      t.string :first_name_kana
      t.string :nickname
      t.date :birthday

      t.timestamps
    end
  end
end
