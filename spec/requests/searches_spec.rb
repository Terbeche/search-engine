require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /index" do
    it 'returns http success' do
      get '/searches'
      expect(response).to have_http_status(:success)
    end

    it 'returns the most common searches' do
      Search.create!(term: 'term1', ip: '127.0.0.1', count: 5)
      Search.create!(term: 'term2', ip: '127.0.0.1', count: 3)
      Search.create!(term: 'term3', ip: '127.0.0.1', count: 7)

      get '/searches'
      
      expect(response.body).to include('term3')
      expect(response.body).to include('term1')
      expect(response.body).to include('term2')
    end
  end
end
