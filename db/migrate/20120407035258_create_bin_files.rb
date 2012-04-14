class CreateBinFiles < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :type
      t.string :name
      t.text :data
      t.string :file
      t.references :directory
      t.references :user

      t.timestamps
    end
  end
end
