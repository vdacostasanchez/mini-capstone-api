require "http"

response = HTTP.get("http://localhost:3000/all-products")

products = response.parse

pp products
