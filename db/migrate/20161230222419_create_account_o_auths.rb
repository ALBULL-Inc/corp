class CreateAccountOAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :account_o_auths do |t|
      t.belongs_to :account, foreign_key: true, index: true
      t.string :provider,                       index: true
      t.string :uid,                            index: true
      t.string :email,                          index: true
      t.string :access_token,                   index: true
      t.string :avatar
      t.text :data

      t.timestamps null: false
    end
  end
end
