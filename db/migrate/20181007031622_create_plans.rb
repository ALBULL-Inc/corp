class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.boolean  :subscription           # 定期課金かどうか
      t.string   :title
      t.integer  :amount
      t.string   :currency               # jpyのみ
      t.string   :interval               # subscription:trueの場合必須。month or year
      t.integer  :trial_days, default: 0 # お試し無料期間
      t.datetime :start_at
      t.datetime :end_at
      t.integer  :position
      t.text     :detail
      t.string   :ser_id                 # pay.jpのプランID
      t.string   :image_src

      t.timestamps
    end
  end
end
