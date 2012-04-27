class AddFullnameToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :fullname, :text
  end
end
