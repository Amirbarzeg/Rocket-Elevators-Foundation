json.extract! lead, :id, :FullName, :CompanyName, :Email, :Phone, :ProjectName, :ProjectDescription, :Departement, :Message, :AttachedFile, :DateOfRequest, :created_at, :updated_at
json.url lead_url(lead, format: :json)
