require "test_helper"

class OrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @or = ors(:one)
  end

  test "should get index" do
    get ors_url
    assert_response :success
  end

  test "should get new" do
    get new_or_url
    assert_response :success
  end

  test "should create or" do
    assert_difference('Or.count') do
      post ors_url, params: { or: { address: @or.address, cumtomer_name: @or.cumtomer_name, product_name: @or.product_name } }
    end

    assert_redirected_to or_url(Or.last)
  end

  test "should show or" do
    get or_url(@or)
    assert_response :success
  end

  test "should get edit" do
    get edit_or_url(@or)
    assert_response :success
  end

  test "should update or" do
    patch or_url(@or), params: { or: { address: @or.address, cumtomer_name: @or.cumtomer_name, product_name: @or.product_name } }
    assert_redirected_to or_url(@or)
  end

  test "should destroy or" do
    assert_difference('Or.count', -1) do
      delete or_url(@or)
    end

    assert_redirected_to ors_url
  end
end
