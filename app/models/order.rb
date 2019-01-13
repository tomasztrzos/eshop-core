class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products, dependent: :destroy
  has_many :products, through: :orders_products

  validates_presence_of :status

  before_create :set_slug
  after_create :associate_products_and_reset_users_cart
  after_create :add_to_queue

  scope :owned_by, ->(user) { where(user: user) }

  enum status: { created: 0, accepted: 1, sent: 2, canceled: 3 }

  private

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Order.where(slug: slug).exists?
    end
  end

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

  def add_to_queue
    if Rails.env.eql? 'staging'
      hash = OrderService.new(id: id).get_summary_hash
      GoogleCloud::PubSubAdapter.enqueue_email(hash)
    end
  end
end
