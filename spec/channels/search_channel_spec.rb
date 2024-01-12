require 'rails_helper'

RSpec.describe SearchChannel, type: :channel do
  before do
    # Initialize connection with identifiers
    stub_connection
  end

  it 'successfully subscribes and streams from search_channel' do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('search_channel')
  end
end
