class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.belongs_to :organization, foreign_key: true
      t.boolean :enable, default: true, null: false
      t.string :title
      t.text :body
      t.datetime :publish_at

      t.timestamps
    end
    add_index :blogs, [:organization_id, :enable, :publish_at]
  end
end
