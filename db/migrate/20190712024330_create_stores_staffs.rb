class CreateStoresStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :stores_staffs do |t|
      t.belongs_to :store, foreign_key: true
      t.belongs_to :staff, foreign_key: true

      t.date :effective_on #開始日
      t.date :expiration_on #終了日

      t.timestamps
    end
  end
end
