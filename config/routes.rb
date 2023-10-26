Rails.application.routes.draw do
  get "/all-products", controller: "products", action: "all_products"

  get "/one-product/:name" => "products#one_product"
end
