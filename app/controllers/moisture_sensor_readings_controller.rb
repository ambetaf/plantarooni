class MoistureSensorReadingsController < ApplicationController
  def index
    @readings = MoistureSensorReading.order(:created_at).reverse
  end
end
