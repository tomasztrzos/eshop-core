require 'rails_helper'

RSpec.describe 'Carts Products API', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:products) { create_list(:product, 10) }
  let!(:carts_products) { create_list(:carts_product, 10) }
  let(:carts_product_id) { carts_products.first.id }

  describe 'GET /api/v1/carts_products' do
    before { get '/api/v1/carts_products', params: { cart_id: user.cart.id } }

    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/products/:id' do
    before { get "/api/v1/carts_products/#{carts_product_id}" }

    context 'when the record exists' do
      it 'returns the carts product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(carts_product_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:carts_product_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find CartsProduct/)
      end
    end
  end

  describe 'POST /api/v1/carts_products' do
    let(:valid_attributes) { { cart_id: user.cart.id, product_id: products.last.id, amount: 1 } }

    context 'when the request is valid' do
      before { post '/api/v1/carts_products', params: valid_attributes }

      it 'creates a carts product - cart_id' do
        expect(json['relationships']['cart']['data']['id']).to eq(user.cart.id.to_s)
      end

      it 'creates a carts product - product_id' do
        expect(json['relationships']['product']['data']['id']).to eq(products.last.id.to_s)
      end

      it 'creates a carts product - amount' do
        expect(json['attributes']['amount']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/carts_products', params: { amount: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Cart must exist/)
      end
    end
  end

  describe 'PUT /api/v1/carts_products/:id' do
    let(:valid_attributes) { { amount: 2 } }

    context 'when the record exists' do
      before { put "/api/v1/carts_products/#{carts_product_id}", params: valid_attributes }

      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['attributes']['amount']).to eq(2)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/carts_products/:id' do
    before { delete "/api/v1/carts_products/#{carts_product_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
