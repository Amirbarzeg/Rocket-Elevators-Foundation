require "application_system_test_case"

class ElevatorsTest < ApplicationSystemTestCase
  setup do
    @elevator = elevators(:one)
  end

  test "visiting the index" do
    visit elevators_url
    assert_selector "h1", text: "Elevators"
  end

  test "creating a Elevator" do
    visit elevators_url
    click_on "New Elevator"

    fill_in "Certificateofinspection", with: @elevator.CertificateOfInspection
    fill_in "Dateofcommissioning", with: @elevator.DateOfCommissioning
    fill_in "Dateoflastinspection", with: @elevator.DateOfLastInspection
    fill_in "Elevatortype", with: @elevator.ElevatorType
    fill_in "Info", with: @elevator.Info
    fill_in "Model", with: @elevator.Model
    fill_in "Notes", with: @elevator.Notes
    fill_in "Serialnumber", with: @elevator.SerialNumber
    fill_in "Status", with: @elevator.Status
    click_on "Create Elevator"

    assert_text "Elevator was successfully created"
    click_on "Back"
  end

  test "updating a Elevator" do
    visit elevators_url
    click_on "Edit", match: :first

    fill_in "Certificateofinspection", with: @elevator.CertificateOfInspection
    fill_in "Dateofcommissioning", with: @elevator.DateOfCommissioning
    fill_in "Dateoflastinspection", with: @elevator.DateOfLastInspection
    fill_in "Elevatortype", with: @elevator.ElevatorType
    fill_in "Info", with: @elevator.Info
    fill_in "Model", with: @elevator.Model
    fill_in "Notes", with: @elevator.Notes
    fill_in "Serialnumber", with: @elevator.SerialNumber
    fill_in "Status", with: @elevator.Status
    click_on "Update Elevator"

    assert_text "Elevator was successfully updated"
    click_on "Back"
  end

  test "destroying a Elevator" do
    visit elevators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Elevator was successfully destroyed"
  end
end
