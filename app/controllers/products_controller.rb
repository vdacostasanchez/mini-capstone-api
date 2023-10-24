class ProductsController < ApplicationController
  def all_products
    contacts = Product.all
    render json: contacts.as_json
  end
end
