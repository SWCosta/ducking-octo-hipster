class AddExtensionAndSizeToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :extension, :string, :default => ""
    add_column :nodes, :size, :integer
  end
end
