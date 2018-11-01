class CreateAccountsPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts_plans do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :plan, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
