class OrdersController < ApplicationController
  def create
    @product = Product.find_by(id: params["product_id"])
    subtotal_amount = @product.price * params["quantity"].to_i
    tax_amount = subtotal_amount * 0.9
    total_amount = subtotal_amount + tax_amount

    @order = Order.create(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal_amount,
      tax: tax_amount,
      total: total_amount,
    )
    render json: "Order created successfully"
  end

  def show
    if current_user.id
      @order = Order.find_by(id: params["id"])
      render template: "orders/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def index
    if current_user
      @orders = Order.all
      render template: "orders/index"
    else
      render json: { errors: @orders.errors.full_messages }, status: 422
    end
  end
end
