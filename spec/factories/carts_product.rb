FactoryBot.define do
  factory :carts_product do
    cart_id { User.last.cart.id }
    product_id { Product.all.sample.id }
    amount { [1, 2, 3].sample }
  end
end
