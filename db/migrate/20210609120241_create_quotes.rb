class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :BuildingType
      t.integer :NumberOfFloors
      t.integer :NumberOfBasements
      t.integer :NumberOfcompanies
      t.integer :NumberOfParkingSpots
      t.integer :NumberOfElevators
      t.integer :NumberOfApartments
      t.integer :NumberOfCorporations
      t.integer :NumberOfOccupany
      t.integer :NumberOfBusinessHours
      t.integer :ElevatorAmount
      t.integer :ColumnAmount
      t.string :ProductLine
      t.integer :ElevatorUnitCost
      t.integer :ElevatorTotalCost
      t.integer :InstallationCost
      t.integer :TotalPrice

      t.timestamps
    end
  end
end
