class CreateBinFiles < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :type
      t.string :name
      t.text :data
      t.string :file
      t.references :directory
      t.references :user
      t.string :ancestry

      t.timestamps
    end

    add_index :nodes, :ancestry
  end
end
