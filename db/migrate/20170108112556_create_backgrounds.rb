class CreateBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :backgrounds do |t|
      t.belongs_to :profile, foreign_key: true
      t.integer    :background_type,           index: true
      t.date       :joined_on,                 index: true
      t.date       :left_on
      t.string     :site
      t.string     :department
      t.text       :outline

      t.timestamps
    end
    add_index :backgrounds, [:profile_id, :background_type, :joined_on], name: 'idx_backgrounds_compo_001'
  end
end
