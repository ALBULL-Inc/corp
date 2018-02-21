class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.boolean :enable, default: true, null: false
      t.string :title
      t.text :body
      t.datetime :publish_at

      t.timestamps
    end
  end
end
