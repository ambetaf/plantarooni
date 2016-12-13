class MoistureSensorJob
  include SuckerPunch::Job


  def perform
moisture_sensor_time = Time.now
    Board.moisture_sensor.when_data_received do |data|
      if Time.now - moisture_sensor_time > 5.minutes
        MoistureSensorReading.create(measurement: data)
        moisture_sensor_time = Time.now
        Board.sprinkler.send(data.to_i < SystemSettings.instance.moisture_threshold ? :on : :off) unless SystemSettings.instance.manual_control
      end
    end
  end
end
