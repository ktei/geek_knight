class CreateMemoNotes < ActiveRecord::Migration
  def up
    create_table :memo_notes do |t|
      t.string :name
      t.integer :memo_folder_id
      t.text :content
      t.timestamps
    end
    add_index :memo_notes, :memo_folder_id
  end

  def down
    drop_table :memo_notes
  end
end
