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

  DhtSensorJob.perform_async

  MoistureSensorJob.perform_async
rescue Dino::BoardNotFound
	puts 'huh?'
end
