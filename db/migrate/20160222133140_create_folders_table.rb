class CreateFoldersTable < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :title
      t.string :image 
      end
  end
end
