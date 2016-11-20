class TemperatureSensorReadingsController < ApplicationController
  def index
    @readings = TemperatureSensorReading.order(:created_at).reverse
  end
end
