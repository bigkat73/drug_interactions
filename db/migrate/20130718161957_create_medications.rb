class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :nui
      t.string :name

      t.timestamps
    end
  end
end
