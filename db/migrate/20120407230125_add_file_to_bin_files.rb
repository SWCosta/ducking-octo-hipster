class AddFileToBinFiles < ActiveRecord::Migration
  def change
    add_column :bin_files, :file, :string
  end
end
