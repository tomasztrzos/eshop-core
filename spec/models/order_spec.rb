require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:orders_products) }
  it { should have_many(:products).through(:orders_products) }
  # Validation tests
  it { should validate_presence_of(:status) }
end
