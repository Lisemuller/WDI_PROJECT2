class RenameFilesTableToLinks < ActiveRecord::Migration
  def change
    rename_table :files, :links
  end
end
