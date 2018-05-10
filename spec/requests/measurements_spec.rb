require 'rails_helper'

RSpec.describe 'Measurements API' do
  # init test data
  let!(:the_post) { create(:post) }
  let!(:measurements) { create_list(:measurement, 20, post_id: the_post.id) }
  let(:post_id) { the_post.id }
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
  #
  # GET /posts/:post_id/measurements/:id
  describe 'GET /posts/:post_id/measurements/:id' do
    before { get "/posts/#{post_id}/measurements/#{id}" }

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the measurement' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when post doesnt exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Measurement/)
      end
    end
  end
  #
  # POST /posts/:post_id/measurements
  #
  describe 'POST /posts/post_id/measurements' do
    let(:vaild_attributes) { { Upit: 12 } }

    context 'when request is valid' do
      before { post "/posts/#{post_id}/measurements", params: vaild_attributes }

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post "/posts/#{post_id}/measurements", params: {} }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
  # ===
  describe 'PUT /posts/post_id/measurements/id' do
    let(:vaild_attributes) { { Upit: 21 } }

    before do
      put "/posts/#{post_id}/measurements/#{id}",
          params: vaild_attributes
    end

    it 'returns 204' do
      expect(response).to have_http_status(204)
    end

    it 'changes post' do
      updated_measurement = Measurement.find(id)
      expect(updated_measurement.Upit).to eq(21)
    end
  end
  # ===
  describe 'DELETE /posts/post_id/measurements/id' do
    it 'returns code 204' do
      delete "/posts/#{post_id}/measurements/#{id}"
      expect(response).to have_http_status(204)
    end
  end
end
