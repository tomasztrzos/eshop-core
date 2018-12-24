class Api::V1::OrdersController < ApplicationController

  def show
    load_order

    json_response(@order)
  end

  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  def update
    load_order

    @order.update!(order_params)
    json_response(@order)
  end

  private

  def order_params
    params.permit(:status, :user_id)
  end

  def load_order
    @order = Order.find(params[:id])
  end
end
