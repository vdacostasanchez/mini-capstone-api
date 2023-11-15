class OrdersController < ApplicationController
  def create
    @order = Order.create(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: params["subtotal"],
      tax: params["tax"],
      total: params["total"],
    )
    render json: "Order created successfully"
  end

  def show
    @order = Order.find_by(id: params["id"])
    render template: "orders/show"
  end

  def index
    @orders = Order.all
    render template: "orders/index"
  end
end
