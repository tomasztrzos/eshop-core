class User < ApplicationRecord
  rolify
  
  has_one :cart
  has_many :orders

  has_secure_password

  validates_length_of :password, minimum: 6, on: :create
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :create_cart_and_associate

  private

  def create_cart_and_associate
    cart = Cart.create(user: self)
  end
end
