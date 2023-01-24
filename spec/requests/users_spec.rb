require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'testing GET /users' do
    it 'should return http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'should return response body that includes correct placeholder text' do
      get '/'
      expect(response.body).to include 'Empty'
    end
    it 'should render users index page' do
      get '/'
      expect(response).to render_template('index')
    end
    context 'testing GET /users' do
      it 'should render detail page successfuly' do
        get '/users/1'
        expect(response).to have_http_status(:success)
      end
      it 'should render details' do
        get '/users/1'
        expect(response).to render_template('detail')
      end
    end
  end
end
