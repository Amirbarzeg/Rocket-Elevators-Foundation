require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { BuildingType: @quote.BuildingType, ColumnAmount: @quote.ColumnAmount, ElevatorAmount: @quote.ElevatorAmount, ElevatorTotalCost: @quote.ElevatorTotalCost, ElevatorUnitCost: @quote.ElevatorUnitCost, InstallationCost: @quote.InstallationCost, NumberOfApartments: @quote.NumberOfApartments, NumberOfBasements: @quote.NumberOfBasements, NumberOfBusinessHours: @quote.NumberOfBusinessHours, NumberOfCorporations: @quote.NumberOfCorporations, NumberOfElevators: @quote.NumberOfElevators, NumberOfFloors: @quote.NumberOfFloors, NumberOfOccupany: @quote.NumberOfOccupany, NumberOfParkingSpots: @quote.NumberOfParkingSpots, NumberOfcompanies: @quote.NumberOfcompanies, ProductLine: @quote.ProductLine, TotalPrice: @quote.TotalPrice } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { BuildingType: @quote.BuildingType, ColumnAmount: @quote.ColumnAmount, ElevatorAmount: @quote.ElevatorAmount, ElevatorTotalCost: @quote.ElevatorTotalCost, ElevatorUnitCost: @quote.ElevatorUnitCost, InstallationCost: @quote.InstallationCost, NumberOfApartments: @quote.NumberOfApartments, NumberOfBasements: @quote.NumberOfBasements, NumberOfBusinessHours: @quote.NumberOfBusinessHours, NumberOfCorporations: @quote.NumberOfCorporations, NumberOfElevators: @quote.NumberOfElevators, NumberOfFloors: @quote.NumberOfFloors, NumberOfOccupany: @quote.NumberOfOccupany, NumberOfParkingSpots: @quote.NumberOfParkingSpots, NumberOfcompanies: @quote.NumberOfcompanies, ProductLine: @quote.ProductLine, TotalPrice: @quote.TotalPrice } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
