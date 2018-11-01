class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :recruit, foreign_key: true
      t.integer :status, index: true
      t.text :comment

      t.timestamps
    end
    add_index :entries, [:account_id, :recruit_id, :status]
    add_index :entries, [:account_id, :status]
    add_index :entries, [:recruit_id, :status]
  end
end
