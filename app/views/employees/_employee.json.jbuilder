json.extract! employee, :id, :FirstName, :LastName, :Title, :Email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
