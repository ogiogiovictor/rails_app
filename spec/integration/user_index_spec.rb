require 'rails_helper'

RSpec.describe 'Test the Main Index page', type: :feature do
  describe 'GET the index page' do
    before(:each) do
      @first_user = User.create(
        name: 'Victor',
        photo: 'https://ibedc.com/filesupload/imagebuild/625350ecda1e22.55685312.jpg',
        bio: 'Teacher',
        post_counter: 14
      )
      @first_user.save!
      @another_user = User.create(
        name: 'John',
        photo: 'https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg',
        bio: 'Developer',
        post_counter: 2
      )
      @another_user.save!

      visit root_path

      @first_user_post = Post.create(
        title: 'My First Post',
        text: 'Victor First Post',
        comments_count: 0,
        likes_count: 3,
        author: @first_user
      )

      @second_user_post = Post.create(
        title: 'My Second Post',
        text: 'John Second Post',
        comments_count: 0, likes_count: 0,
        author: @another_user
      )

      @first_comment = Comment.create(text: 'Victor\'s Comment', author: User.first, post: @first_user_post)
      @second_comment = Comment.create(text: 'Johns Comments', author: User.first, post: @first_user_post)
    end

    it 'I can see the profile picture for each user.' do
      visit(user_path(@first_user.id))
      expect(page).to have_css('img[src*="https://ibedc.com/filesupload/imagebuild/625350ecda1e22.55685312.jpg"]')
    end

    it 'I can see the username of all other users' do
      visit root_path
      expect(page).to have_content('Victor')
      expect(page).to have_content('John')
    end

    it 'I can see the number of posts each user has written' do
      visit(user_path(@first_user.id))
      expect(@first_user.post_counter).to eql(1)
    end

    it "When I click on a user, it redirects me to that user's show page" do
      visit '/users'
      click_link @first_user.name
      expect(page).to have_current_path(user_path(@first_user))
    end
  end
end
