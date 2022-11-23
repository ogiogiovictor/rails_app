class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.integer :postid
      t.text :text
      t.text :postcounter
      t.timestamps
    end

    add_index :comments, [:authorid, :postid]
  end
end
