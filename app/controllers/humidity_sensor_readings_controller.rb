class HumiditySensorReadingsController < ApplicationController
  def index
    @readings = HumiditySensorReading.order(:created_at).reverse
  end
end
