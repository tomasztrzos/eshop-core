class Api::V1::ProductsController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    load_products

    json_response(@products)
  end

  def show
    load_product

    json_response(@product)
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def load_products
    @products = Product.all
  end
end
