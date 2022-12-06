require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create(name: 'Victor',
                          photo: 'https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg',
                          bio: 'Marketer',
                          post_counter: 0)
      @user.save!
      visit root_path

      @post1 = Post.create(title: 'Victors Post', text: 'My Post by Victor', comments_count: 0, likes_count: 3,
                           author: @user)
      @post2 = Post.create(title: 'John Post', text: 'This is my second post', comments_count: 0, likes_count: 0,
                           author: @user)

      @comment1 = Comment.create(text: 'First Comment', author: User.first,
                                 post: @post1)
      @comment2 = Comment.create(text: 'Second Comment', author: User.first, post: @post1)

      @like = Like.create(post_id: @post1.id, author_id: @user.id)
    end

    # it "I can see the user\'s profile picture." do
    #    visit(user_posts_path(@user.id))
    #    expect(page).to have_css('img[src*="https://ibedc.com/filesupload/imagebuild/625350c770c886.68494374.jpg"]')
    # end

    it 'I can see the user\'s username.' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Victor')
    end

    it 'I can see the number of posts the user has written.' do
      visit(user_posts_path(@user.id))
      expect(@user.post_counter).to eql(2)
    end

    it 'I can see a post\'s title' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Victors Post')
    end

    it 'I can see some of the post\'s body.' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'My Post by Victor'
    end

    it 'I can see the first comment on a post' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'First Comment'
    end

    it 'I can see how many comments a post has.' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Comments: 2')
    end

    it 'I can see how many likes a post has.' do
      visit(user_posts_path(@user.id))
      expect(@user.likes.count).to eql(1)
    end

    it "When I click on a post, it redirects me to that post's show page" do
      visit(user_posts_path(@user.id))
      click_link 'Victors Post'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
