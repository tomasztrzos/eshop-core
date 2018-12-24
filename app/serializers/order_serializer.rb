class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status
  belongs_to :user
  has_many :orders_products
end
