class CreateDimCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :CreationDate
      t.string :CompanyName
      t.string :FullNameOfCompanyNameContact
      t.string :EmailOfCompanyMainContact
      t.integer :NbElevators
      t.string :CustomerCity
    end
  end
end
