class AddRxCuiToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :rx_cui, :string
  end
end
