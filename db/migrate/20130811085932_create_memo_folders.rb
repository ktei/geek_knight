class CreateMemoFolders < ActiveRecord::Migration
  def up
    create_table :memo_folders do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :memo_folders
  end
end
