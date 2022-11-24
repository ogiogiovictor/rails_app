class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :title
      t.text :text
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.timestamps
    end

    add_index :posts, :author_id
    #Ex:- add_index("admin_users", "username")
  end
end
