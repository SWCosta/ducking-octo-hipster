class AddUserIdToBinFiles < ActiveRecord::Migration
  def change
    add_column :bin_files, :user_id, :integer

  end
end
