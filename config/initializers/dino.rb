module Board
  class << self
    attr_accessor :board, :moisture_sensor, :sprinkler, :cooling_fan, :exhaust_fan
  end
end

begin
  Board.board = Dino::Board.new(Dino::TxRx::Serial.new)
  Board.moisture_sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
  Board.sprinkler = Dino::Components::Led.new(pin: 13, board: board)
  Board.cooling_fan = Dino::Components::Led.new(pin: 12, board: board)
  Board.exhaust_fan = Dino::Components::Led.new(pin: 11, board: board)

  DhtSensorJob.perform_async()

  moisture_sensor.when_data_received do |data|
    if !moisture_sensor_time || Time.now - moisture_sensor_time > 5.seconds
      MoistureSensorReading.create(measurement: data)
      moisture_sensor_time = Time.now
      next if SystemSettings.instance.manual_control
      Board.sprinkler.send(data.to_i < SystemSetting.instance.moisture_threshold ? :on : :off)
    end
  end
rescue Dino::BoardNotFound

end
