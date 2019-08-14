class AddOrgToStore < ActiveRecord::Migration[5.0]
  def change
    add_reference :stores, :organization, foreign_key: true
  end
end
