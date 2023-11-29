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
      render :show
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
end
