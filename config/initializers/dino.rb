module Board
  class << self
    attr_accessor :board, :moisture_sensor, :sprinkler, :cooling_fan, :exhaust_fan
  end
end

begin
  Board.board = Dino::Board.new(Dino::TxRx::Serial.new)
  Board.moisture_sensor = Dino::Components::Sensor.new(pin: 'A0', board: Board.board)
  Board.sprinkler = Dino::Components::Led.new(pin: 13, board: Board.board)
  Board.cooling_fan = Dino::Components::Led.new(pin: 12, board: Board.board)
  Board.exhaust_fan = Dino::Components::Led.new(pin: 11, board: Board.board)

  moisture_sensor_time = Time.now
  counter = 0
  Board.moisture_sensor.when_data_received do |data|
    if counter == 0 || Time.now - moisture_sensor_time > 5.minutes
      ActiveRecord::Base.connection_pool.with_connection do
        MoistureSensorReading.create(measurement: data)
      end
      moisture_sensor_time = Time.now
      Board.sprinkler.send(data.to_i < SystemSettings.instance.moisture_threshold ? :on : :off) unless SystemSettings.instance.manual_control
      counter += 1
    end
  end

  DhtSensorWorker.perform_async
rescue Dino::BoardNotFound
	puts 'huh?'
end
