json.extract! customer, :id, :CompanyName, :NameOfContact, :CompanyContactPhone, :EmailOfTheCompany, :CompanyDescription, :NameOfServiceTechAuthority, :TechAuhtorityPhone, :TechManagerServiceEmail, :created_at, :updated_at
json.url customer_url(customer, format: :json)
