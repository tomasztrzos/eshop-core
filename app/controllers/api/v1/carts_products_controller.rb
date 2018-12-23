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
    params.permit(:cart_id, :product_id, :amount)
  end

  def load_carts_product
    @carts_product = CartsProduct.find(params[:id])
  end

  def load_carts_products
    @carts_products = CartsProduct.joins(:cart).where(cart_id: params[:cart_id])
  end
end
