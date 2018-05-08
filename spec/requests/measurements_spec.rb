require 'rails_helper'

RSpec.describe 'Measurements API' do
  # init test data
  let!(:post) { create(:post) }
  let(:post_id) { post.id }
  let!(:measurements) { create_list(:measurement, 20, post_id: post.id) }
  let(:id) { measurements.first.id }

  # GET /posts/:post_id/measurements
  describe 'GET /posts/:post_id/measurements' do
    before { get "/posts/#{post_id}/measurements" } 

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all the measurements' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns 404 status' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end

  end

end
