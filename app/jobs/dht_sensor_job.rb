class DhtSensorJob
  include SuckerPunch::Job

  def perform(cooling_fan, exhaust_fan)
    while true
      val = DhtSensor.read(4, 11)
      TemperatureSensorReading.create(measurement: val.temp)
      HumiditySensorReading.create(measurement: val.humidity)
      unless SystemSettings.instance.manual_control
        cooling_fan.send(val.temp > SystemSettings.instance.temperature_threshold ? :on : :off)
        exhaust_fan.send(val.humidity > SystemSettings.instance.humidity_threshold ? :on : :off)
      end
      sleep 5
    end
  end
end
