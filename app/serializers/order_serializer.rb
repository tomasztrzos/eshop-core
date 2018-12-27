class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :slug
  belongs_to :user
  has_many :orders_products
end
