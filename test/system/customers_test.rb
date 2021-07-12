require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Companycontactphone", with: @customer.CompanyContactPhone
    fill_in "Companydescription", with: @customer.CompanyDescription
    fill_in "Companyname", with: @customer.CompanyName
    fill_in "Emailofthecompany", with: @customer.EmailOfTheCompany
    fill_in "Nameofcontact", with: @customer.NameOfContact
    fill_in "Nameofservicetechauthority", with: @customer.NameOfServiceTechAuthority
    fill_in "Techauhtorityphone", with: @customer.TechAuhtorityPhone
    fill_in "Techmanagerserviceemail", with: @customer.TechManagerServiceEmail
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Companycontactphone", with: @customer.CompanyContactPhone
    fill_in "Companydescription", with: @customer.CompanyDescription
    fill_in "Companyname", with: @customer.CompanyName
    fill_in "Emailofthecompany", with: @customer.EmailOfTheCompany
    fill_in "Nameofcontact", with: @customer.NameOfContact
    fill_in "Nameofservicetechauthority", with: @customer.NameOfServiceTechAuthority
    fill_in "Techauhtorityphone", with: @customer.TechAuhtorityPhone
    fill_in "Techmanagerserviceemail", with: @customer.TechManagerServiceEmail
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
