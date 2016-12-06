class ChangeDataTypesOfPlants < ActiveRecord::Migration[5.0]
  def change
    change_column :plants, :humidity_threshold, :float
    change_column :plants, :temperature_threshold, :float
  end
end
