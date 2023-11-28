require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "is_discounted?", "tax", "total", "supplier", "inventory", "images", "categories"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
           params: { name: "Test", price: 19, image_url: "test.jpg", description: "test description", supplier_id: Supplier.first.id },
           headers: { "Authorization" => "Bearer #{@jwt}" }
    end
    assert_difference "Product.count", 0 do
      post "/products.json",
           params: {},
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 422
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
          params: { name: "Updated name" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"].to_i
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json",
          params: { name: "" },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
