require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
      title: "Lorem Ipsum",
      description: "Wibbles are fun!",
      image_url: "7apps.jpg",
      price: 19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select "table tr.list_line_odd", minimum: 1
    assert_select "table tr.list_line_even", minimum: 1
    assert_select "table tr td img.list_image", minimum: 3
    assert_select "table tr td.list_description", minimum: 3
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
  end
  
  test "can't delete product in cart" do
    assert_no_difference("Product.count") do
      delete product_url(products(:two))
    end
    
    assert_redirected_to products_url
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
