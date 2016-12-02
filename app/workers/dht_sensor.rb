class DhtSensorWorker
  include Sidekiq::Worker
  def perform(name)
    case name
    when 'dht-sensor'
      loop do
        val = DhtSensor.read(4, 11)
        puts val.temp
        puts val.temp_f
        puts val.humidity
        sleep 1
      end
    else
      puts ':('
    end
  end
end
