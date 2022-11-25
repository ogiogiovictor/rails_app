class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  # belongs_to :user, class_name: 'User'
  belongs_to :author, class_name: 'User'

  after_save :update_post_counter

  def update_post_counter
    author.update(posts_counter: author.posts.all.length)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
