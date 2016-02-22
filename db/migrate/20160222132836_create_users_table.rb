class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do  |t|
      t.integer :folder_id
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :image
  end
end
