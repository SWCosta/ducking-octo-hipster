class AddDirToBinFiles < ActiveRecord::Migration
  def change
    add_column :bin_files, :dir, :string

  end
end
