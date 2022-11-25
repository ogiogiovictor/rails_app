class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      #t.integer :author_id
      #t.integer :post_id
      t.references  :post, null: false, foreign_key: { to_table: :posts }
      t.references  :author, null: false, foreign_key: { to_table: :users }
      t.text :text
      t.timestamps
    end

    add_index :comments, [:text]
  end
end
