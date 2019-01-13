class Product < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :carts, through: :carts_products
  has_many :orders_products, dependent: :destroy
  has_many :orders, through: :orders_products

  validates_presence_of :name, :price
end
