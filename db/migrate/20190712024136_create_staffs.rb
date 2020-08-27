class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :code
      t.string :first_name
      t.string :last_name
      t.string :first_kana
      t.string :last_kana
      t.string :nickname

      t.timestamps
    end
  end
end
