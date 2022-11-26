class Post < ApplicationRecord
  # belongs_to :user, class_name: 'User'
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_count, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.all.length)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
