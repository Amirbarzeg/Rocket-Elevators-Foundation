class AddEmailToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Email, :string
  end
end
