class CartedProductsController < ApplicationController
  def create
    if current_user
      @carted_product = CartedProduct.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        order_id: nil,
        status: "carted",
      )
      if @carted_product.valid?
        render :show
      else
        render json: { errors: @carted_product.errors.full_messages }
      end
    end
  end

  def index
    if current_user
      @carted_products = CartedProduct.all
      if params[:status]
        status = CartedProduct.where(status: params[:status])
        @carted_products = status
      end
      render :index
    end
  end

  def destroy
    carted_product = current_user.carted_product.find_by(id: params[:id], status: "carted")
    carted_product.update(status: "removed")
    render json: { status: "Carted item removed" }
  end
end
