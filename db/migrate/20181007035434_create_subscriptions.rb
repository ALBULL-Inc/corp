class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :plan, foreign_key: true
      t.string  :sub_id
      t.string  :token
      t.integer :status
      t.datetime :period_start
      t.datetime :period_end
      t.timestamps
    end
  end
end
