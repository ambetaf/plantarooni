class MoistureSensorReadingsController < ApplicationController
  def index
    @readings = MoistureSensorReading.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
end
