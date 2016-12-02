class DhtSensorJob
  include SuckerPunch::Job

  def perform
    while true
      val = DhtSensor.read(4, 11)
      puts val.temp
      puts val.temp_f
      puts val.humidity
      sleep 5
    end
  end
end
