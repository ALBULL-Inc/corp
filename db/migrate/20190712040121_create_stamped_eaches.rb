class CreateStampedEaches < ActiveRecord::Migration[5.0]
  def change
    create_table :stamped_eaches do |t|
      t.belongs_to :stamped_daily, foreign_key: true, index: true
      t.belongs_to :staff, foreign_key: true, index: true
      t.belongs_to :workplace, foreign_key: true, index: true
      t.integer :stamped_type_id
      t.datetime :stamped_at
      t.integer :ymd, index: true

      t.timestamps
    end
  end
end
