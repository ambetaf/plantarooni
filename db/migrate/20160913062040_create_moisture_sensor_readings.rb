class CreateMoistureSensorReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :moisture_sensor_readings do |t|

      t.integer :measurement
      t.timestamps
    end
  end
end
