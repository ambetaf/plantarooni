class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def update_threshold
    plant = Plant.find(params[:id])
    SystemSettings.instance.update(humidity_threshold: plant.humidity_threshold, moisture_threshold: plant.moisture_threshold, temperature_threshold: plant.temperature_threshold)
  end

end
