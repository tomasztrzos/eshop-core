require 'rails_helper'

RSpec.describe OrdersProduct, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:product) }
  # Validation tests
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:product_id) }
end
