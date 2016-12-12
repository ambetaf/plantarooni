class MoistureSensorJob
  include SuckerPunch::Job

  def perform
    Board.moisture_sensor.when_data_received do |data|
      MoistureSensorReading.create(measurement: data)
      moisture_sensor_time = Time.now
      Board.sprinkler.send(data.to_i < SystemSettings.instance.moisture_threshold ? :on : :off) unless SystemSettings.instance.manual_control
      sleep 300
    end
  end
end
