json.extract! elevator, :id, :SerialNumber, :Model, :ElevatorType, :Status, :DateOfCommissioning, :DateOfLastInspection, :CertificateOfInspection, :Info, :Notes, :created_at, :updated_at
json.url elevator_url(elevator, format: :json)
