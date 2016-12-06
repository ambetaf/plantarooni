class SystemSettingsController < ApplicationController
  before_action :find_settings, only: [:update, :configuration]
  def configuration
  end

  def update
    if SystemSettings.instance.update(settings_params) # if success
      redirect_to system_settings_configuration_path
      flash.now[:alert] = 'Failed to create plant'
    else # if not
      render :configuration
    end
  end

  private

    def settings_params
      params.permit(:moisture_threshold, :temperature_threshold, :humidity_threshold)
    end

    def find_settings
      @moisture_threshold = SystemSettings.instance.moisture_threshold
      @temperature_threshold = SystemSettings.instance.temperature_threshold
      @humidity_threshold = SystemSettings.instance.humidity_threshold
      @manual_control = SystemSettings.instance.manual_control
      @sprinkler_manual_on = SystemSettings.instance.sprinkler_manual_on
      @cooling_manual_on = SystemSettings.instance.cooling_manual_on
      @exhaust_manual_on = SystemSettings.instance.exhaust_manual_on
    end
end
