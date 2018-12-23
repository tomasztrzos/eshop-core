require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_and_belong_to_many(:products) }
end
