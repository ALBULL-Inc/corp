class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.boolean :enable, default: false, null: false
      t.string :name
      t.string :postcode
      t.string :city
      t.string :address
      t.string :gmap_query
      t.string :tel
      t.string :fax
      t.string :opening_time # 開店時間
      t.string :closing_time # 閉店時間
      t.string :regular_holiday # 定休日
      t.date :opened_on # オープンした日
      t.date :closed_on # クローズした日
      t.text :spec
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
