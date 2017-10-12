class CreateUsageRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :usage_records do |t|
      t.belongs_to :month, foreign_key: true
      t.belongs_to :child, foreign_key: true
      t.belongs_to :place, foreign_key: true

      t.timestamps
    end
  end
end
