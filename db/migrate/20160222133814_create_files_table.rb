class CreateFilesTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :url
      t.string :title
      t.string :description
      t.string :image
    end
  end
end
