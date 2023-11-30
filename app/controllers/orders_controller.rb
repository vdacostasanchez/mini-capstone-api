class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    if @order.valid?
      carted_product.update_all(status: "purchased", order_id: @order.id)
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
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
