class CreateBinFiles < ActiveRecord::Migration
  def change
    create_table :bin_files do |t|
      t.string :name
      t.string :ext
      t.integer :size

      t.timestamps
    end
  end
end
