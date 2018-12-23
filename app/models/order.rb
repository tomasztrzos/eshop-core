class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products
  has_many :products, through: :orders_products

  validates_presence_of :status

  enum status: { created: 0, accepted: 1, sent: 2, canceled: 3 }
end
