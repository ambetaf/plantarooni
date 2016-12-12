class DhtSensorJob
  include SuckerPunch::Job

  def perform
    while true
      val = DhtSensor.read(4, 11)
      ActiveRecord::Base.connection_pool.with_connection do
        TemperatureSensorReading.create(measurement: val.temp)
        HumiditySensorReading.create(measurement: val.humidity)
        unless SystemSettings.instance.manual_control
          Board.cooling_fan.send(val.temp > SystemSettings.instance.temperature_threshold ? :on : :off)
          Board.exhaust_fan.send(val.humidity > SystemSettings.instance.humidity_threshold ? :on : :off)
        end
        sleep 300
      end
    end
  end
end
