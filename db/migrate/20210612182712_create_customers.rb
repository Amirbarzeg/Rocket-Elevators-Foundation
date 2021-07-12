class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :CompanyName
      t.string :NameOfContact
      t.string :CompanyContactPhone
      t.string :EmailOfTheCompany
      t.text :CompanyDescription
      t.string :NameOfServiceTechAuthority
      t.string :TechAuhtorityPhone
      t.string :TechManagerServiceEmail

      t.timestamps
    end
  end
end
