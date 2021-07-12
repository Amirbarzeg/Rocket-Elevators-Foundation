class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :FullNameOfTheBuildingAdministrator
      t.string :EmailOfTheAdministratorOfTheBuilding
      t.string :PhoneNumberOfTheBuildingAdministrator
      t.string :FullNameOfTheTechContactForTheBuilding
      t.string :TechContactEmail
      t.string :TechContactPhone

      t.timestamps
    end
  end
end
