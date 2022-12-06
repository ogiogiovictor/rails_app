require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
    before(:each) do
    @user = User.create(
      name: 'Promise',
      bio: 'Fullstack Developer',
      photo: 'http://promise.com',
      posts_counter: 2
      )

    @post1 = Post.create(
      author: @user,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 3
    )

    @post2 = Post.create(
      author: @user,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 2,
      likes_counter: 2
    )
  end
    describe 'user show pages' do
       
    end

end