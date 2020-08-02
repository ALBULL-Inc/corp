class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.belongs_to :organization, foreign_key: true, index: true
      t.boolean  :enable,          default: false, null: false
      t.string   :pkey,                            null: false
      t.string   :name
      t.integer  :postcode
      t.string   :region
      t.string   :locality
      t.string   :address
      t.string   :building
      t.string   :tel
      t.string   :fax
      t.string   :opening_time # 開店時間
      t.string   :closing_time # 閉店時間
      t.string   :regular_holiday # 定休日
      t.date     :opened_on # オープンした日
      t.date     :closed_on # クローズした日
      t.text     :spec
      t.text     :near_station
      t.string   :gmap_query
      t.string   :latitude
      t.string   :longitude
      t.string   :facebook_uid
      t.string   :twitter_uid
      t.string   :instagram_uid
      t.integer  :position,        default: 0,     null: false

      t.timestamps
    end
    add_index :stores, [:pkey, :enable]
    add_index :stores, [:position, :enable]
  end
end
