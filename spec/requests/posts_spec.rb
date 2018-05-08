require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  # initialize test data
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }

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

  describe 'GET /posts/:id' do
    before { get "/posts/#{post_id}" }

    context 'if the record exists' do
      it 'returns post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'if the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns could not find message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
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

    context 'when the request is invalid' do
      before {post '/posts', params: { num_line: "121", main_phone_number: "89371234567" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns message Can"t be blank' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe 'PUT /posts/id ' do
    let(:valid_attributes) {{ main_phone_number: "9371234567" }}

    context 'when the record exists' do
      before {put "/posts/#{post_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns code 204' do
        expect(response).to have_http_status(204)
      end

    end
  end

  describe 'DELETE /posts/id' do
    before {delete "/posts/#{post_id}"}

    it 'returns code 204' do
      expect(response).to have_http_status(204)
    end

  end

end
