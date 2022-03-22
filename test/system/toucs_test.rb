require "application_system_test_case"

class ToucsTest < ApplicationSystemTestCase
  setup do
    @touc = toucs(:one)
  end

  test "visiting the index" do
    visit toucs_url
    assert_selector "h1", text: "Toucs"
  end

  test "creating a Touc" do
    visit toucs_url
    click_on "New Touc"

    fill_in "Touc", with: @touc.touc
    click_on "Create Touc"

    assert_text "Touc was successfully created"
    click_on "Back"
  end

  test "updating a Touc" do
    visit toucs_url
    click_on "Edit", match: :first

    fill_in "Touc", with: @touc.touc
    click_on "Update Touc"

    assert_text "Touc was successfully updated"
    click_on "Back"
  end

  test "destroying a Touc" do
    visit toucs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Touc was successfully destroyed"
  end
end
