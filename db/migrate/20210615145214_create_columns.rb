class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :ColumnType
      t.integer :NbOfFloorsServed
      t.string :Status
      t.text :Info
      t.text :Notes

      t.timestamps
    end
  end
end
