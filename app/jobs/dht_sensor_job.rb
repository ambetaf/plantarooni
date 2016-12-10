class DhtSensorJob
  include SuckerPunch::Job

  def perform
    while true
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      val = DhtSensor.read(4, 11)
      TemperatureSensorReading.create(measurement: val.temp)
      HumiditySensorReading.create(measurement: val.humidity)
      unless SystemSettings.instance.manual_control
        Board.cooling_fan.send(val.temp > SystemSettings.instance.temperature_threshold ? :on : :off)
        Board.exhaust_fan.send(val.humidity > SystemSettings.instance.humidity_threshold ? :on : :off)
      end
      sleep 1
    end
  end
end
