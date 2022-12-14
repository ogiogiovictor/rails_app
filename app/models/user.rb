class User < ApplicationRecord
  # has_many :posts, class_name: 'post', foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  # after_create :generate_api_token

  validates :name, presence: true, allow_blank: false
  # validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # private
  # def generate_api_token
  #   self.api_token = Devise.friendly_token
  #   self.save
  # end

  def admin?
    role == 'admin'
  end
end
