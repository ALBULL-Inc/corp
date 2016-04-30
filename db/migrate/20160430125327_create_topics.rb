class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.boolean :enable
      t.string :title
      t.text :body
      t.datetime :publish_at
      t.boolean :carousel
      t.string :carousel_img

      t.timestamps null: false
    end
    add_index :topics, [:enable, :publish_at, :carousel]
  end
end
