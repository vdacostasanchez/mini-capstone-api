Rails.application.routes.draw do
  get "/all-products", controller: "products", action: "all_products"

  get "/random-movie", controller: "products", action: "random_movie"
end
