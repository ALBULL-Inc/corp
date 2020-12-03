class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
