class CreateSubscriptionLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_logs do |t|
      t.belongs_to :subscription, foreign_key: true
      t.text :response
      t.timestamps
    end
  end
end
