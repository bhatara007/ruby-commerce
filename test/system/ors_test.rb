require "application_system_test_case"

class OrsTest < ApplicationSystemTestCase
  setup do
    @or = ors(:one)
  end

  test "visiting the index" do
    visit ors_url
    assert_selector "h1", text: "Ors"
  end

  test "creating a Or" do
    visit ors_url
    click_on "New Or"

    fill_in "Address", with: @or.address
    fill_in "Cumtomer name", with: @or.cumtomer_name
    fill_in "Product name", with: @or.product_name
    click_on "Create Or"

    assert_text "Or was successfully created"
    click_on "Back"
  end

  test "updating a Or" do
    visit ors_url
    click_on "Edit", match: :first

    fill_in "Address", with: @or.address
    fill_in "Cumtomer name", with: @or.cumtomer_name
    fill_in "Product name", with: @or.product_name
    click_on "Update Or"

    assert_text "Or was successfully updated"
    click_on "Back"
  end

  test "destroying a Or" do
    visit ors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Or was successfully destroyed"
  end
end
