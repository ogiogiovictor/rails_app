require 'rails_helper'

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
end
