class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end


  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
      if @plant.update(plant_params)
        redirect_to('/', notice: "Plant was updated")
      else
        flash.now[:alert] = 'Failed to create plant'
        render action: 'new'
      end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
      redirect_to('/', notice: "Plant was deleted!")
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to('/', notice: "Plant was created")
    else
      flash.now[:alert] = 'Failed to create plant'
      render action: 'new'
    end
  end


  private
  def plant_params
      params.permit(:name, :moisture_threshold, :temperature_threshold, :humidity_threshold)
  end
end
