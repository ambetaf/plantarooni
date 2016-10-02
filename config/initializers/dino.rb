board = Dino::Board.new(Dino::TxRx::Serial.new)
moisture_sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
sprinkler = Dino::Components::Led.new(pin: 13, board: board)

last_time = Time.now
moisture_sensor.when_data_received do |data|
  if Time.now - last_time > 5.seconds
    puts data
    # MoistureSensorReading.create(measurement: data)
    if data.to_i < SystemSettings.instance.moisture_threshold
      puts "it's dry water now!"
      sprinkler.send(:on)
    else
      sprinkler.send(:off)
    end
    last_time = Time.now
  end
end
