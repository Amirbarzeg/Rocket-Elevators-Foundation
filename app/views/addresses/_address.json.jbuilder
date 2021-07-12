json.extract! address, :id, :TypeOfAddress, :Status, :Entity, :NumberAndStreet, :Apt, :City, :PostalCode, :Country, :Notes, :created_at, :updated_at
json.url address_url(address, format: :json)
