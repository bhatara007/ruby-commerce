require "application_system_test_case"

class OrderrsTest < ApplicationSystemTestCase
  setup do
    @orderr = orderrs(:one)
  end

  test "visiting the index" do
    visit orderrs_url
    assert_selector "h1", text: "Orderrs"
  end

  test "creating a Orderr" do
    visit orderrs_url
    click_on "New Orderr"

    click_on "Create Orderr"

    assert_text "Orderr was successfully created"
    click_on "Back"
  end

  test "updating a Orderr" do
    visit orderrs_url
    click_on "Edit", match: :first

    click_on "Update Orderr"

    assert_text "Orderr was successfully updated"
    click_on "Back"
  end

  test "destroying a Orderr" do
    visit orderrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orderr was successfully destroyed"
  end
end
