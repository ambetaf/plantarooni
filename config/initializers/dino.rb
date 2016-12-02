# board = Dino::Board.new(Dino::TxRx::Serial.new)
# moisture_sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
# sprinkler = Dino::Components::Led.new(pin: 13, board: board)
# temperature_sensor = Dino::Components::Sensor.new(pin: 'A1', board: board)
# cooling_fan = Dino::Components::Led.new(pin: 12, board: board)

DhtSensorJob.perform_async

# moisture_sensor_time = Time.now
# moisture_sensor.when_data_received do |data|
#   if Time.now - moisture_sensor_time > 5.seconds
#     puts data
#     MoistureSensorReading.create(measurement: data)
#     if data.to_i < SystemSettings.instance.moisture_threshold
#       # puts "it's dry water now!"
#       sprinkler.send(:on)
#     else
#       sprinkler.send(:off)
#     end
#     moisture_sensor_time = Time.now
#   end
# end
#
#
# temperature_sensor_time = Time.now
# temperature_sensor.when_data_received do |data|
#   if Time.now - temperature_sensor_time > 5.seconds
#     temperature = data.to_f / 1024 * 500
#     TemperatureSensorReading.create(measurement: temperature)
#     if temperature > SystemSettings.instance.temperature_threshold
#       cooling_fan.send(:on)
#     else
#       cooling_fan.send(:off)
#     end
#     temperature_sensor_time = Time.now
#   end
# end

# require "dht-sensor-ffi"
# val = DhtSensor.read(4, 22) # pin=4, sensor type=DHT-22
# puts val.temp               # => 21.899999618530273 (temp in C)
# puts val.temp_f             # => 71.4199993133545 (temp in F)
# puts val.humidity           # => 22.700000762939453 (relative humidity %)
