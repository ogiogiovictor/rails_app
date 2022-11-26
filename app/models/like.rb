class Like < ApplicationRecord
  # belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  belongs_to :author, class_name: 'User'

  def update_post_like
    post.update(likes_count: post.likes.all.length)
  end
end
