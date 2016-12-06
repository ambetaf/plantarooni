class SystemSettingsController < ApplicationController
  before_action :find_settings, only: [:update, :configuration]
  def configuration
  end

  def update
    byebug
    # if SystemSettings.instance.update(settings_params) # if success
    #   redirect_to system_settings_configuration_path
    #   flash.now[:alert] = 'Failed to create plant'
    # else # if not
    #   render :configuration
    # end
  end

  def toggle
    SystemSettings.toggle_manual_control
  end

  private

    def settings_params
      params.permit(:moisture_threshold, :temperature_threshold, :humidity_threshold, :sprinkler_manual_on, :cooling_manual_on, :exhaust_manual_on)
    end

    def find_settings
      instance = SystemSettings.instance
      @moisture_threshold = instance.moisture_threshold
      @temperature_threshold = instance.temperature_threshold
      @humidity_threshold = instance.humidity_threshold
      @manual_control = instance.manual_control
      @sprinkler_manual_on = instance.sprinkler_manual_on
      @cooling_manual_on = instance.cooling_manual_on
      @exhaust_manual_on = instance.exhaust_manual_on
    end
end
