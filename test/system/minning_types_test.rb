require "application_system_test_case"

class MinningTypesTest < ApplicationSystemTestCase
  setup do
    @minning_type = minning_types(:one)
  end

  test "visiting the index" do
    visit minning_types_url
    assert_selector "h1", text: "Minning Types"
  end

  test "creating a Minning type" do
    visit minning_types_url
    click_on "New Minning Type"

    fill_in "Acronym", with: @minning_type.acronym
    fill_in "Description", with: @minning_type.description
    click_on "Create Minning type"

    assert_text "Minning type was successfully created"
    click_on "Back"
  end

  test "updating a Minning type" do
    visit minning_types_url
    click_on "Edit", match: :first

    fill_in "Acronym", with: @minning_type.acronym
    fill_in "Description", with: @minning_type.description
    click_on "Update Minning type"

    assert_text "Minning type was successfully updated"
    click_on "Back"
  end

  test "destroying a Minning type" do
    visit minning_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Minning type was successfully destroyed"
  end
end
