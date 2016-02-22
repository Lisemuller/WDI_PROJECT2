class CreateFoldersTable < ActiveRecord::Migration
  def change
    create_table :title do |t|
      t.string :title
      t.string :image 
      end
  end
end
