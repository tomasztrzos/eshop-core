class Api::V1::Admin::OrdersController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    load_orders

    json_response(@orders)
  end

  def show
    load_order

    json_response(@order)
  end

  def update
    load_order

    @order.update!(order_params)
    json_response(@order)
  end

  private

  def order_params
    params.permit(:status)
  end

  def load_order
    @order = Order.find_by(params[:slug])
  end

  def load_orders
    @orders = Order.all
  end
end
