class Api::V1::Admin::OrdersController < Api::V1::Admin::BaseController

  def index
    load_orders

    json_response(@orders)
  end

  private

  def order_params
    params.permit(:status, :user_id)
  end

  def load_orders
    @orders = Order.all
  end
end
