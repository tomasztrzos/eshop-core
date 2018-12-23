class CartsProductSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :cart
  belongs_to :product
  attributes :amount
end
