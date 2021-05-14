require "test_helper"

class OrderrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderr = orderrs(:one)
  end

  test "should get index" do
    get orderrs_url
    assert_response :success
  end

  test "should get new" do
    get new_orderr_url
    assert_response :success
  end

  test "should create orderr" do
    assert_difference('Orderr.count') do
      post orderrs_url, params: { orderr: {  } }
    end

    assert_redirected_to orderr_url(Orderr.last)
  end

  test "should show orderr" do
    get orderr_url(@orderr)
    assert_response :success
  end

  test "should get edit" do
    get edit_orderr_url(@orderr)
    assert_response :success
  end

  test "should update orderr" do
    patch orderr_url(@orderr), params: { orderr: {  } }
    assert_redirected_to orderr_url(@orderr)
  end

  test "should destroy orderr" do
    assert_difference('Orderr.count', -1) do
      delete orderr_url(@orderr)
    end

    assert_redirected_to orderrs_url
  end
end
