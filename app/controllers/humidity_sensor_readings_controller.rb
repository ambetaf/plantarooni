class HumiditySensorReadingsController < ApplicationController
  def index
    @readings = HumiditySensorReading.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
end
