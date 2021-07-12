class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.string :SerialNumber
      t.date :DateOfCommissioning
      t.integer :BuildingId
      t.integer :CustomerId
      t.string :BuildingCity
    end
  end
end
