class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      #t.integer :author_id
      #t.integer :post_id
      t.references  :post, null: false, foreign_key: { to_table: :posts }
      t.references  :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end

    add_index :likes, [:post_id, :user_id]
  end
end
