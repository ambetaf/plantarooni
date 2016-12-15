class HomeController < ApplicationController

  def index
    @current_temperature = TemperatureSensorReading.last
    @current_moisture = MoistureSensorReading.last
    @current_humidity = HumiditySensorReading.last
  end

  def stream
  end
end
