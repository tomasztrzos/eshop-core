require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  login_user

  describe 'GET /api/v1/products' do
    before { get '/api/v1/products' }

    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/products/:id' do
    before { get "/api/v1/products/#{product_id}", headers: { 'Authorization': access_token } }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end
end
