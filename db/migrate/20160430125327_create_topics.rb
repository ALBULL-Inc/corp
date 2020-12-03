class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.boolean :enable
      t.bigint :topicable_id
      t.string :topicable_type
      t.string :title
      t.text :body
      t.datetime :publish_at

      t.timestamps null: false
    end
    add_index :topics, [:topicable_type, :topicable_id, :enable, :publish_at], name: 'ttep_idx'
  end
end
