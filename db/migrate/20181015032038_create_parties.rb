class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.boolean :enable
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
