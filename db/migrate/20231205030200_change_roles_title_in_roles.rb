class ChangeRolesTitleInRoles < ActiveRecord::Migration[7.1]
  def change
    rename_column :roles, :role_title, :title
  end
end
