require "application_system_test_case"

class NumsTest < ApplicationSystemTestCase
  setup do
    @num = nums(:one)
  end

  test "visiting the index" do
    visit nums_url
    assert_selector "h1", text: "Nums"
  end

  test "creating a Num" do
    visit nums_url
    click_on "New Num"

    fill_in "Number", with: @num.number
    click_on "Create Num"

    assert_text "Num was successfully created"
    click_on "Back"
  end

  test "updating a Num" do
    visit nums_url
    click_on "Edit", match: :first

    fill_in "Number", with: @num.number
    click_on "Update Num"

    assert_text "Num was successfully updated"
    click_on "Back"
  end

  test "destroying a Num" do
    visit nums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Num was successfully destroyed"
  end
end
