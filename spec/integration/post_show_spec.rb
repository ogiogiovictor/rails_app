require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @user1 = User.create(
        name: 'Victor', bio: 'Developer', post_counter: 0,
        photo: 'https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg'
      )
      @user1.save!
      @user2 = User.create(
        name: 'Uka', bio: 'Front End Developer', post_counter: 0,
        photo: 'https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg'
      )
      @user2.save!
      @user3 = User.create(
        name: 'Demond', bio: 'Backend Developer', post_counter: 0,
        photo: 'https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg'
      )
      @user3.save!

      visit root_path

      @post1 = Post.create(title: 'My First Post', text: 'Walking a new', comments_count: 0, likes_count: 2,
                           author: @user1)
      @post2 = Post.create(title: 'My Second Post', text: 'Making us Fit', comments_count: 0, likes_count: 1,
                           author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'The concept in creed', comments_count: 0, likes_count: 0,
                           author: @user1)

      @comment1 = Comment.create(text: 'Comment One', author: @user2,
                                 post: @post1)
      @comment2 = Comment.create(text: 'Comment Two', author: @user3, post: @post1)
      @comment3 = Comment.create(text: 'Comment Three', author: @user4, post: @post1)

      @like = Like.create(post_id: @post1.id, author_id: @user2.id)

      visit user_post_path(@user1, @post1)
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content('My First Post')
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content('Victor')
    end

    it 'I can see how many comments it has.' do
      expect(@user2.comments.count).to eql(1)
    end

    it 'I can see how many likes it has' do
      expect(@user2.likes.count).to eql(1)
    end

    it 'I can see the post body' do
      expect(page).to have_content('My First Post')
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content 'Victor'
      expect(page).to have_content 'Uka'
      expect(page).to have_content 'Demond'
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content 'Comment One'
      expect(page).to have_content 'Comment Two'
    end
  end
end
