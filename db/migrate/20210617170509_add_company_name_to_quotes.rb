class AddCompanyNameToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :CompanyName, :string
  end
end
