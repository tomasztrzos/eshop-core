class Api::V1::OrdersController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    load_orders

    json_response(@orders)
  end

  def show
    load_order

    json_response(@order)
  end

  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  private

  def order_params
    params.permit(:status).tap { |p| p[:user_id] = current_user.id }
  end

  def load_order
    @order = Order.owned_by(current_user).find_by!(slug: params[:slug])
  end

  def load_orders
    @orders = Order.owned_by(current_user)
  end
end
