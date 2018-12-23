require 'rails_helper'

RSpec.describe Product, type: :model do
  # Association test
  it { should have_many(:carts_products) }
  it { should have_many(:carts).through(:carts_products) }
  it { should have_many(:orders_products) }
  it { should have_many(:orders).through(:orders_products) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end
