class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render template: "products/index"
  end

  def one_product
    @product = Product.find_by(name: params["name"])
    render template: "products/show"
  end
end
