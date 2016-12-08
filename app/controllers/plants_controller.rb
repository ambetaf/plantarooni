class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to('/', notice: "Plant was updated")
    else
      flash.now[:alert] = 'Failed to create plant'
      render action: 'new'
    end
  end

  def destroy
    @plant.destroy
    redirect_to('/', alert: "Plant was deleted!")
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to('/', success: "Plant was created")
    else
      flash.now[:alert] = 'Failed to create plant'
      render action: 'new'
    end
  end

  def update_threshold
    plant = Plant.find(params[:id])
    SystemSettings.instance.update(humidity_threshold: plant.humidity_threshold, moisture_threshold: plant.moisture_threshold, temperature_threshold: plant.temperature_threshold)
    unless SystemSettings.instance.manual_control
      SystemSettings.check_sensors
    end
    redirect_to '/', notice: "Update was successful! Your plant is " + plant.name
  end

  private

  def plant_params
    params.permit(:name, :moisture_threshold, :temperature_threshold, :humidity_threshold)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
