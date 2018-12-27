class OrderService
  def initialize(params)
    @order = Order.find(params[:id])
  end

  def get_summary_hash
    products_array = []
    orders_products = OrdersProduct.where(order_id: @order.id)
    total_price_of_order = 0

    orders_products.each do |orders_product|
      product = orders_product.product
      total_price = product.price * orders_product.amount
      total_price_of_order += total_price

      products_array << {
        name: product.name,
        amount: orders_product.amount,
        price_per_item: product.price,
        total_price: total_price
      }
    end

    {
      slug: @order.slug,
      created_at: @order.created_at.to_s,
      total_price: total_price_of_order,
      products: products_array
    }
  end
end
