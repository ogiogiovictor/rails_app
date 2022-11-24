class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_user_comment
    user.update(comments_counter: user.comments.all.length)
  end

  def update_post_comment
    post.update(comments_counter: post.comments.all.length)
  end
end
