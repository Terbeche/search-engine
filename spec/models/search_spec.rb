require 'rails_helper'

RSpec.describe Search, type: :model do
  describe '.most_common' do
    it 'returns the most common search' do
      Search.create!(term: 'term1', ip: '127.0.0.1', count: 5)
      Search.create!(term: 'term2', ip: '127.0.0.1', count: 3)
      Search.create!(term: 'term3', ip: '127.0.0.1', count: 7)

      most_common_searches = Search.most_common(ip: '127.0.0.1')

      expect(most_common_searches.size).to eq(3)

      expect(most_common_searches[0].term).to eq('term3')
      expect(most_common_searches[1].term).to eq('term1')
      expect(most_common_searches[2].term).to eq('term2')
    end
  end

  describe '.record' do
    it 'creates a new search record with the given term and ip' do
      expect {
        Search.record(term: 'test', ip: '127.0.0.1')
      }.to change(Search, :count).by(1)

      search = Search.last
      expect(search.term).to eq('test')
      expect(search.ip).to eq('127.0.0.1')
      expect(search.count).to eq(1)
    end

    it 'increments the count of an existing search record' do
      existing_search = Search.create!(term: 'test', ip: '127.0.0.1', count: 1)

      expect {
        Search.record(term: 'test', ip: '127.0.0.1')
      }.not_to change(Search, :count)

      expect(existing_search.reload.count).to eq(2)
    end
  end
end
