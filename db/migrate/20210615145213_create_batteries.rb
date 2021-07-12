class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :BType
      t.string :Status
      t.date :DateOfCommissioning
      t.date :DateOfLastInspection
      t.string :CertificateOfOperations
      t.text :Info
      t.text :Notes

      t.timestamps
    end
  end
end
