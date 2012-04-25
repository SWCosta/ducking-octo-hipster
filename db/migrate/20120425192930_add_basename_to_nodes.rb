class AddBasenameToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :basename, :text
  end
end
