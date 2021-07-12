class CreateFactQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :QuoteId
      t.date :Creation
      t.string :CompanyName
      t.string :Email
      t.integer :NbElevator
    end
  end
end
