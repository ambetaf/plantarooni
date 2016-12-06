class ChangeHumiditySensorToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :humidity_sensor_readings, :measurement, :float
  end
end
