require 'rails_helper'
# require 'users_controller'

RSpec.describe 'Users', type: :request do
  describe 'Get users Index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'Renders the right template index' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe 'Rendering the show page for the show routes' do
    before :each do
      get '/users'
    end

    it 'Returns or renders the show template' do
      expect(response).to render_template('users/index')
    end
  end
end
