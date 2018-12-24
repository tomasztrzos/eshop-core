class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products
  has_many :products, through: :orders_products

  validates_presence_of :status

  after_create :associate_products_and_reset_users_cart

  enum status: { created: 0, accepted: 1, sent: 2, canceled: 3 }

  private

  def associate_products_and_reset_users_cart
    cart = user.cart
    carts_products = CartsProduct.joins(:cart).where(cart_id: cart.id)

    ActiveRecord::Base.transaction do
      carts_products.each do |carts_product|
        OrdersProduct.create!(
          order_id: id,
          product_id: carts_product.product_id,
          amount: carts_product.amount
        )
      end

      cart.reset_elements
    end
  end
end
