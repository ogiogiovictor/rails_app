class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.text :postid
      t.timestamps
    end

    add_index :likes, [:authorid, :postid]
  end
end
