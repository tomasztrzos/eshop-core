require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:products) { create_list(:product, 10) }
  let!(:carts_products) { create_list(:carts_product, 10) }
  let!(:order) { FactoryBot.create(:order) }
  let(:order_slug) { order.slug }

  login_user

  describe 'GET /api/v1/orders/:id' do
    before do
      get "/api/v1/orders/#{order_slug}", headers: { 'Authorization': access_token }
    end

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['attributes']['slug']).to eq(order_slug)

        expect(
          json['relationships']['user']['data']['id']
        ).to eq(user.id.to_s)

        expect(
          json['relationships']['orders_products']['data'].size
        ).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:order_slug) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe 'POST /api/v1/orders' do
    let!(:carts_products_2) { create_list(:carts_product, 5) }
    let(:valid_attributes) { { status: 'created' } }

    context 'when the request is valid' do
      before { post '/api/v1/orders', params: valid_attributes, headers: { 'Authorization': access_token } }

      it 'creates a order with corrent amount of products' do
        expect(
          json['relationships']['orders_products']['data'].size
        ).to eq(5)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/orders', params: {}, headers: { 'Authorization': access_token } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Status can't be blank/)
      end
    end
  end
end
