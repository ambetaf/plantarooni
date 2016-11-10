class TemperatureSensorReadingController < ApplicationController
  def index
    @readings = TempSensorReading.order(:created_at).reverse
  end
end
