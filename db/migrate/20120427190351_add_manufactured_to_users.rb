class AddManufacturedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manufactured, :boolean, :default => false
  end
end
