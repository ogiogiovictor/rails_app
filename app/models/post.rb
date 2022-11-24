class Post < ApplicationRecord
  #belongs_to :user, class_name: 'user' 
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  belongs_to :user, class_name: 'User'


  def update_user_post
    user.update(posts_counter: user.posts.all.length)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

end
