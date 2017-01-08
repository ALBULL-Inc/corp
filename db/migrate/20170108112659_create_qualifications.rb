class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.belongs_to :profile, foreign_key: true
      t.date :issued_on, index: true
      t.string :title
      t.text :outline

      t.timestamps
    end
    add_index :qualifications, [:profile_id, :issued_on]
  end
end
