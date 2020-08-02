class CreateOrganizationsAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations_accounts do |t|
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
