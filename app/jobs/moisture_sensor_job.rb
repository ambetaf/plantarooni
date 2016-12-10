class MoistureSensorJob
  include SuckerPunch::Job

  def perform
    Board.moisture_sensor.when_data_received do |data|
      if !moisture_sensor_time || Time.now - moisture_sensor_time > 1.minute
        MoistureSensorReading.create(measurement: data)
        moisture_sensor_time = Time.now
        Board.sprinkler.send(data.to_i < SystemSetting.instance.moisture_threshold ? :on : :off) unless SystemSettings.instance.manual_control
      end
    end
  end
end
