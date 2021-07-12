class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :TypeOfAddress
      t.string :Status
      t.string :Entity
      t.string :NumberAndStreet
      t.string :Apt
      t.string :City
      t.string :PostalCode
      t.string :Country
      t.float :latitude
      t.float :longitude
      t.text :Notes

      t.timestamps
    end
  end
end
