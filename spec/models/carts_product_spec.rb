require 'rails_helper'

RSpec.describe CartsProduct, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
  # Validation tests
  it { should validate_presence_of(:amount) }
end
