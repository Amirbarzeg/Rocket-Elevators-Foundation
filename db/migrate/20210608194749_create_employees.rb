class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Title
      t.string :Email

      t.timestamps
    end
  end
end
