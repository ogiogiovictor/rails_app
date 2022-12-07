require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Promise',
      bio: 'Fullstack Developer',
      photo: 'http://promise.com',
      post_counter: 2
    )

    @post1 = Post.create(
      author: @user,
      title: 'First post',
      text: 'This is my first post',
      comments_count: 1,
      likes_count: 3
    )

    @post2 = Post.create(
      author: @user,
      title: 'Second post',
      text: 'This is my second post',
      comments_count: 2,
      likes_count: 2
    )

    @post3 = Post.create(
      author: @user,
      title: 'Third post',
      text: 'This is my second post',
      comments_count: 2,
      likes_count: 2
    )
  end
  describe 'user show pages' do
    describe 'a user show page' do
      it 'displays the users profile photo' do
        visit user_path(@user)
        expect(page).to have_css("img[src*='http://promise.com']")
      end
    end

    it 'displays the user name' do
      visit user_path(@user)
      expect(page).to have_content('Promise')
    end

    it 'displays the user bio' do
      visit user_path(@user)
      expect(page).to have_content('Fullstack Developer')
    end

    it 'displays the right Number of posts' do
      visit user_path(@user)
      expect(page).to have_content('2')
    end

    it 'User can see the first 3 post' do
      expect(@user.recent_posts.length).to be 3
    end

    it 'displays all the available users posts' do
      visit user_path(@user)
      expect(page).to have_content('First post')
      expect(page).to have_content('Second post')
    end

    it 'displays a button that helps view all of a users posts' do
      visit user_path(@user)
      expect(page).to have_content('See all posts')
    end

    it 'click to see all posts, it redirects to the users posts index page' do
      visit user_path(@user)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'takes to root page when submitted with correct input' do
      visit user_path(@user)
      click_link 'See all posts'
      expect(current_path).to eql(user_posts_path(user_id: @user.id))
    end
  end
end
