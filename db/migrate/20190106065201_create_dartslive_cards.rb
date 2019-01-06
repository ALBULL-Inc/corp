class CreateDartsliveCards < ActiveRecord::Migration[5.0]
  def change
    create_table :dartslive_cards do |t|
      t.belongs_to :account, foreign_key: true
      t.string :no, null: false, index: true
      t.string :name
      t.string :password
      t.text :stats

      t.timestamps
    end
  end
end
