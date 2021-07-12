class CreateFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :Employee_ID
      t.integer :Building_ID
      t.integer :Battery_ID
      t.integer :Column_ID
      t.integer :Elevator_ID
      t.datetime :Start_date
      t.datetime :End_date
      t.string :Result
      t.text :Report
      t.string :Status
    end
  end
end
