require "application_system_test_case"

class CustomerOrdersTest < ApplicationSystemTestCase
  setup do
    @customer_order = customer_orders(:one)
  end

  test "visiting the index" do
    visit customer_orders_url
    assert_selector "h1", text: "Customer Orders"
  end

  test "creating a Customer order" do
    visit customer_orders_url
    click_on "New Customer Order"

    click_on "Create Customer order"

    assert_text "Customer order was successfully created"
    click_on "Back"
  end

  test "updating a Customer order" do
    visit customer_orders_url
    click_on "Edit", match: :first

    click_on "Update Customer order"

    assert_text "Customer order was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer order" do
    visit customer_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer order was successfully destroyed"
  end
end
