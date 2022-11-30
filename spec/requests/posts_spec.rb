require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get post Index' do
    before :each do
      get '/users/:user_id/posts/'
    end

    it 'Returns http status of success for post index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Returns a list of posts' do
      expect(response.body).to include('posts')
    end

    it 'Render the right index template for post' do
      expect(response).to render_template(:index)
    end

    describe 'Get all related routes to post show template' do
      before :each do
        get '/users/:user_id/posts/id'
      end
    end
  end
end
