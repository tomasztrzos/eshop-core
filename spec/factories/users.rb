FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    country { Faker::Address.country }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.unique.email }
    password { 'B7EFU4c6' }
    password_confirmation { 'B7EFU4c6' }
  end
end
