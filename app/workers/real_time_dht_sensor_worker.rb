class RealTimeDhtSensorWorker
  include Sidekiq::Worker

  def perform
    while true
      break if JobStopper.stop_dht_sensor
      val = DhtSensor.read(4, 11)
      ActionCable.server.broadcast 'dht_sensor_channel', temperature: val.temp, humidity: val.humidity
    end
  end
end
