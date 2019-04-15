class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :type, index: true
      t.string :registration_key
      t.belongs_to :account
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :subscribers, [:registration_key, :type], unique: true
    add_index :subscribers, [:active, :type]
  end
end
