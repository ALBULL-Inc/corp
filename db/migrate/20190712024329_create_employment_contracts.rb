class CreateEmploymentContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :employment_contracts do |t|
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :staff, foreign_key: true

      t.date :effective_on #いわゆる契約開始日
      t.date :expiration_on #退職もここで

      t.timestamps
    end
  end
end
