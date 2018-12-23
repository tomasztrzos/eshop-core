class CartsProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates_presence_of :amount, :cart_id, :product_id
end
