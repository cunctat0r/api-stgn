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

  describe 'POST /posts' do
    let(:valid_attributes) {{main_phone_number: "9372212268", line_name: "Сахалинская №1", num_tower: "192"}}

    context 'when the request is valid' do
      before {post '/posts', params: valid_attributes}

      it 'creates new post' do
        expect(json['main_phone_number']).to eq("9372212268")
        expect(json['line_name']).to eq("Сахалинская №1")
        expect(json['num_tower']).to eq("192")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end
  end

end
