class ProductsController < ApplicationController
  def all_products
    movies = Product.all
    render json: movies.as_json
  end

  def random_movie
    index = rand(1..3)
    movie = Product.find(index)
    render json: movie.as_json
  end
end
