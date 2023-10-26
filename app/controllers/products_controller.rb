class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: params["title"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    render template: "products/show"
  end
end
