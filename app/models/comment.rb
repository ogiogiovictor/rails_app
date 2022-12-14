class Comment < ApplicationRecord
  # belongs_to :user, class_name: 'User'
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_user_comment
    author.update(comments_count: author.comments.all.length)
  end

  def update_post_comment
    post.update(comments_count: post.comments.all.length)
  end
end
