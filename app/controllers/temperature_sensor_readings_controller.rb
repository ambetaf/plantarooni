class TemperatureSensorReadingsController < ApplicationController
  def index
    @readings = TemperatureSensorReading.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
end
