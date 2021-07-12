class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :SerialNumber
      t.string :Model
      t.string :ElevatorType
      t.string :Status
      t.date :DateOfCommissioning
      t.date :DateOfLastInspection
      t.string :CertificateOfInspection
      t.text :Info
      t.text :Notes

      t.timestamps
    end
  end
end
