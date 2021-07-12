require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "Apt", with: @address.Apt
    fill_in "City", with: @address.City
    fill_in "Country", with: @address.Country
    fill_in "Entity", with: @address.Entity
    fill_in "Notes", with: @address.Notes
    fill_in "Numberandstreet", with: @address.NumberAndStreet
    fill_in "Postalcode", with: @address.PostalCode
    fill_in "Status", with: @address.Status
    fill_in "Typeofaddress", with: @address.TypeOfAddress
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Apt", with: @address.Apt
    fill_in "City", with: @address.City
    fill_in "Country", with: @address.Country
    fill_in "Entity", with: @address.Entity
    fill_in "Notes", with: @address.Notes
    fill_in "Numberandstreet", with: @address.NumberAndStreet
    fill_in "Postalcode", with: @address.PostalCode
    fill_in "Status", with: @address.Status
    fill_in "Typeofaddress", with: @address.TypeOfAddress
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
