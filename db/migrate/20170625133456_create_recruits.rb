class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.boolean :enable
      t.string :title
      t.text :job_content # 職務内容
      t.text :qualification # 応募資格
      t.text :compensation # 待遇処遇
      t.string :working_place # 勤務地
      t.integer :position

      t.timestamps null: false
    end
    add_index :recruits, [:enable,:position]
  end
end
