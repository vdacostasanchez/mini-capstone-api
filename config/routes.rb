Rails.application.routes.draw do
  get "/all-products", controller: "products", action: "all_products"
end
