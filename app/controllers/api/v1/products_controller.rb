class Api::V1::ProductsController < ApplicationController

  def index
    load_products

    json_response(@products)
  end

  def show
    load_product

    json_response(@product)
  end

  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  def update
    load_product

    @product.update!(product_params)
    json_response(@product)
  end

  def destroy
    load_product

    @product.destroy!
    json_response({}, :no_content)
  end

  private

  def product_params
    params.permit(:name, :price)
  end

  def load_product
    @product = Product.find(params[:id])
  end

  def load_products
    @products = Product.all
  end
end