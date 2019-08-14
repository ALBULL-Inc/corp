class CreateStampedEaches < ActiveRecord::Migration[5.0]
  def change
    create_table :stamped_eaches do |t|
      t.belongs_to :stamped_daily, foreign_key: true
      t.belongs_to :staff, foreign_key: true
      t.belongs_to :store, foreign_key: true
      t.integer :stamped_type_id
      t.datetime :stamped_at
      t.integer :ymd

      t.timestamps
    end
  end
end
