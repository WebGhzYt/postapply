class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles, :boolean
  end
end
