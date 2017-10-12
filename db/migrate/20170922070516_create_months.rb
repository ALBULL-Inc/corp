class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.string :ym,                     null: false
      t.boolean :fixed, default: false, null: false

      t.timestamps
    end
  end
end
