class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.string :title
      t.string :title_kana
      t.string :encrypted_code
      t.string :md5_code
      t.string :remember_token

      t.timestamps
    end
  end
end
