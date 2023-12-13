class ChangeReferencesInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :roles, index: true, foreign_key: true
    
    add_reference :users, :role, null: false, foreign_key: true
  end
end
