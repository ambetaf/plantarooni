class DhtSensorJob
  include SuckerPunch::Job

  def perform(board, cooling_fan, exhaust_fan)
    while true
      val = DhtSensor.read(4, 11)
      TemperatureSensorReading.create(measurement: val.temp)
      HumiditySensorReading.create(measurement: val.humidity)
      unless SystemSettings.instance.manual_control
        if val.temp > SystemSettings.instance.temperature_threshold
          cooling_fan.send(:on)
        else
          cooling_fan.send(:off)
        end
        if val.humidity > SystemSettings.instance.humidity_threshold
          exhaust_fan.send(:on)
        else
          exhaust_fan.send(:off)
        end
      end
      sleep 5
    end
  end
end
