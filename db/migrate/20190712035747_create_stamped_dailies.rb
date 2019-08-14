class CreateStampedDailies < ActiveRecord::Migration[5.0]
  def change
    create_table :stamped_dailies do |t|
      t.belongs_to :staff, foreign_key: true
      t.integer :status
      t.datetime :work_start_at
      t.datetime :work_end_at
      t.datetime :rest_start_at
      t.datetime :rest_end_at
      t.integer :ymd

      t.timestamps
    end
  end
end
