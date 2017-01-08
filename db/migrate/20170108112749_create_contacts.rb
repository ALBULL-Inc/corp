class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :profile, foreign_key: true
      t.integer :contact_type, index: true
      t.string :content

      t.timestamps
    end

    add_index :contacts, [:profile_id, :contact_type]
  end
end
