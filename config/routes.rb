Rails.application.routes.draw do
  get "/products" => "products#index"

  get "/products/:id" => "products#show"

  post "/products" => "products#create"

  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  #orders
  post "/orders" => "orders#create"

  get "/orders/:id" => "orders#show"

  get "/orders" => "orders#index"

  #cart
  post "/carted_products" => "carted_products#create"

  get "/carted_products" => "carted_products#index"

  delete "/carted_products" => "carted_products#destroy"
end
