class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    if current_user
      @product = Product.create(
        name: params["name"],
        price: params["price"],
        description: params["description"],
        supplier_id: params["supplier_id"],
      )
      if @product.valid?
        Image.create(url: params[:image_url], product_id: @product.id)
        render :show
      else
        render json: { errors: @product.errors.full_messages }, status: 422
      end
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      image_url: params["image_url"] || @product.image_url,
      description: params["description"] || @product.description,
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "Product was successfully removed" }
  end
end
