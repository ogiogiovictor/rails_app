class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'authorid'
  has_many :comments
  has_many :likes
end
