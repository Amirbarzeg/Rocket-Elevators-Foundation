require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Buildingtype", with: @quote.BuildingType
    fill_in "Columnamount", with: @quote.ColumnAmount
    fill_in "Elevatoramount", with: @quote.ElevatorAmount
    fill_in "Elevatortotalcost", with: @quote.ElevatorTotalCost
    fill_in "Elevatorunitcost", with: @quote.ElevatorUnitCost
    fill_in "Installationcost", with: @quote.InstallationCost
    fill_in "Numberofapartments", with: @quote.NumberOfApartments
    fill_in "Numberofbasements", with: @quote.NumberOfBasements
    fill_in "Numberofbusinesshours", with: @quote.NumberOfBusinessHours
    fill_in "Numberofcorporations", with: @quote.NumberOfCorporations
    fill_in "Numberofelevators", with: @quote.NumberOfElevators
    fill_in "Numberoffloors", with: @quote.NumberOfFloors
    fill_in "Numberofoccupany", with: @quote.NumberOfOccupany
    fill_in "Numberofparkingspots", with: @quote.NumberOfParkingSpots
    fill_in "Numberofcompanies", with: @quote.NumberOfcompanies
    fill_in "Productline", with: @quote.ProductLine
    fill_in "Totalprice", with: @quote.TotalPrice
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Buildingtype", with: @quote.BuildingType
    fill_in "Columnamount", with: @quote.ColumnAmount
    fill_in "Elevatoramount", with: @quote.ElevatorAmount
    fill_in "Elevatortotalcost", with: @quote.ElevatorTotalCost
    fill_in "Elevatorunitcost", with: @quote.ElevatorUnitCost
    fill_in "Installationcost", with: @quote.InstallationCost
    fill_in "Numberofapartments", with: @quote.NumberOfApartments
    fill_in "Numberofbasements", with: @quote.NumberOfBasements
    fill_in "Numberofbusinesshours", with: @quote.NumberOfBusinessHours
    fill_in "Numberofcorporations", with: @quote.NumberOfCorporations
    fill_in "Numberofelevators", with: @quote.NumberOfElevators
    fill_in "Numberoffloors", with: @quote.NumberOfFloors
    fill_in "Numberofoccupany", with: @quote.NumberOfOccupany
    fill_in "Numberofparkingspots", with: @quote.NumberOfParkingSpots
    fill_in "Numberofcompanies", with: @quote.NumberOfcompanies
    fill_in "Productline", with: @quote.ProductLine
    fill_in "Totalprice", with: @quote.TotalPrice
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
