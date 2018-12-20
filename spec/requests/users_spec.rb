require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /api/v1/users' do
    let(:valid_attributes) do
      {
        first_name: 'John',
        last_name: 'Smith',
        street_address: 'Niepodleglosci 124b/14',
        city: 'Warsaw',
        zip_code: '02-621',
        country: 'Poland',
        phone_number: '504 321 312',
        email: 'john.smith@gmail.com',
        password: 'B7EFU4c6',
        password_confirmation: 'B7EFU4c6'
      }
    end

    context 'when the request is valid' do
      before { post '/api/v1/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['data']['attributes']['email']).to eq('john.smith@gmail.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/users', params: {} }

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Password can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
