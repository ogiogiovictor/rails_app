require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(title: 'My first post', text: 'This is my first post.', author: @user, comments_count: 4,
                     likes_count: 6)
  end

  it 'should increment comment_counter by 1' do
    @post.increment!(:comments_count)
    expect(@post.comments_count).to eq(5)
  end
end
