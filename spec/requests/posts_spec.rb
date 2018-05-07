require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  # initialize test data
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first_id }

  describe 'GET /posts' do
    before { get '/posts' }
    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
