require 'rails_helper'

RSpec.describe 'Admin products API', type: :request do
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  login_user

  describe 'POST /api/v1/admin/products' do
    let(:valid_attributes) { { name: 'Lightweight down jacket', price: 39.99 } }

    context 'when the request is valid' do
      before { post '/api/v1/admin/products', params: valid_attributes, headers: { 'Authorization': access_token } }

      it 'creates a product' do
        expect(json['attributes']['name']).to eq('Lightweight down jacket')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/admin/products', params: { name: 'Lightweight down jacket' }, headers: { 'Authorization': access_token } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Price can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/admin/products/:id' do
    let(:valid_attributes) { { name: 'Lightweight down jacket' } }

    context 'when the record exists' do
      before { put "/api/v1/admin/products/#{product_id}", params: valid_attributes, headers: { 'Authorization': access_token } }

      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/admin/products/:id' do
    before { delete "/api/v1/admin/products/#{product_id}", headers: { 'Authorization': access_token } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
