require "application_system_test_case"

class LeadsTest < ApplicationSystemTestCase
  setup do
    @lead = leads(:one)
  end

  test "visiting the index" do
    visit leads_url
    assert_selector "h1", text: "Leads"
  end

  test "creating a Lead" do
    visit leads_url
    click_on "New Lead"

    fill_in "Attachedfile", with: @lead.AttachedFile
    fill_in "Companyname", with: @lead.CompanyName
    fill_in "Dateofrequest", with: @lead.DateOfRequest
    fill_in "Departement", with: @lead.Departement
    fill_in "Email", with: @lead.Email
    fill_in "Fullname", with: @lead.FullName
    fill_in "Message", with: @lead.Message
    fill_in "Phone", with: @lead.Phone
    fill_in "Projectdescription", with: @lead.ProjectDescription
    fill_in "Projectname", with: @lead.ProjectName
    click_on "Create Lead"

    assert_text "Lead was successfully created"
    click_on "Back"
  end

  test "updating a Lead" do
    visit leads_url
    click_on "Edit", match: :first

    fill_in "Attachedfile", with: @lead.AttachedFile
    fill_in "Companyname", with: @lead.CompanyName
    fill_in "Dateofrequest", with: @lead.DateOfRequest
    fill_in "Departement", with: @lead.Departement
    fill_in "Email", with: @lead.Email
    fill_in "Fullname", with: @lead.FullName
    fill_in "Message", with: @lead.Message
    fill_in "Phone", with: @lead.Phone
    fill_in "Projectdescription", with: @lead.ProjectDescription
    fill_in "Projectname", with: @lead.ProjectName
    click_on "Update Lead"

    assert_text "Lead was successfully updated"
    click_on "Back"
  end

  test "destroying a Lead" do
    visit leads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lead was successfully destroyed"
  end
end
