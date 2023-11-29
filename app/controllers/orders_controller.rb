class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    total_amount = 0
    @carted_products.map do |carted_product|
      subtotal_amount = carted_product[:price].to_i * carted_product[:quantity].to_i
      tax_amount = subtotal_amount * 0.9
      total_amount += (subtotal_amount + tax_amount)
    end
    @order = Order.create(
      user_id: current_user.id,
      total: total_amount,
    )
    render :show
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
