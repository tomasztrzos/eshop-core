class Api::V1::CartsProductsController < ApplicationController
  def index
    load_carts_products

    json_response(@carts_products)
  end

  def show
    load_carts_product

    json_response(@carts_product)
  end

  def create
    @carts_product = CartsProduct.create!(carts_products_params)
    json_response(@carts_product, :created)
  end

  def update
    load_carts_product

    @carts_product.update!(carts_products_params)
    json_response(@carts_product)
  end

  def destroy
    load_carts_product

    @carts_product.destroy!
    json_response({}, :no_content)
  end

  private

  def carts_products_params
    params.permit(:product_id, :amount).merge(cart_id: current_user.cart.id)
  end

  def load_carts_product
    @carts_product = CartsProduct.find(params[:id])
  end

  def load_carts_products
    cart_id = current_user.cart.id
    @carts_products = CartsProduct.joins(:cart).where(cart_id: cart_id)
  end
end
