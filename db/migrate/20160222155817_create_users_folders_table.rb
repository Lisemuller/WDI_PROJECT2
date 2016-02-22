class CreateUsersFoldersTable < ActiveRecord::Migration
  def change
    create_join_table :users, :folders
  end
end
