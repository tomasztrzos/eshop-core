class Cart < ApplicationRecord
  belongs_to :user
  has_many :carts_products
  has_many :products, through: :carts_products

  def reset_elements
    self.carts_products.destroy_all
  end
end
