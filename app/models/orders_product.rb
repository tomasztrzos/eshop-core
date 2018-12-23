class OrdersProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :amount, :order_id, :product_id
end
