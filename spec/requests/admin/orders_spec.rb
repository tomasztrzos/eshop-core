require 'rails_helper'

RSpec.describe 'Admin orders API', type: :request do
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:products) { create_list(:product, 10) }
  let!(:carts_products) { create_list(:carts_product, 10) }
  let!(:order) { FactoryBot.create(:order) }
  let(:order_id) { order.id }

  login_user

  describe 'PUT /api/v1/admin/orders/:id' do
    let(:valid_attributes) { { status: 'sent' } }

    context 'when the record exists' do
      before { put "/api/v1/admin/orders/#{order_id}", params: valid_attributes, headers: { 'Authorization': access_token } }

      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['attributes']['status']).to eq('sent')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
