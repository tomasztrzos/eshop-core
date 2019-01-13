class User < ApplicationRecord
  rolify

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_secure_password

  validates_length_of :password, minimum: 6, on: :create
  validates_presence_of :password, on: :create
  validates_presence_of :email, on: :create
  validates_uniqueness_of :email

  after_create :create_cart_and_associate

  private

  def create_cart_and_associate
    cart = Cart.create(user: self)
  end
end
