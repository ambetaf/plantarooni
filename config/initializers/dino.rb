begin
  board = Dino::Board.new(Dino::TxRx::Serial.new)
  moisture_sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
  sprinkler = Dino::Components::Led.new(pin: 13, board: board)
  cooling_fan = Dino::Components::Led.new(pin: 12, board: board)
  exhaust_fan = Dino::Components::Led.new(pin: 11, board: board)

  DhtSensorJob.perform_async(board, cooling_fan, exhaust_fan)

  moisture_sensor_time = Time.now
  moisture_sensor.when_data_received do |data|
    if Time.now - moisture_sensor_time > 5.seconds
      MoistureSensorReading.create(measurement: data)
      moisture_sensor_time = Time.now
      break unless SystemSettings.instance.manual_control
      if data.to_i < SystemSettings.instance.moisture_threshold
        sprinkler.send(:on)
      else
        sprinkler.send(:off)
      end
    end
  end
rescue Dino::BoardNotFound

end
