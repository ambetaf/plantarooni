class RenameTemperatureSensorColumnToTemperatureThreshold < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :Plants, :temperature_sensor, :temperature_threshold
  end

  def self.down
    rename_column :Plants, :temperature_threshold, :temperature_sensor
  end
end
