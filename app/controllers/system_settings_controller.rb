class SystemSettingsController < ApplicationController
  def configuration
    @moisture_threshold = SystemSettings.instance.moisture_threshold
    @temperature_threshold = SystemSettings.instance.temperature_threshold
    @humidity_threshold = SystemSettings.instance.humidity_threshold
  end

  def update
    @moisture_threshold = SystemSettings.instance.moisture_threshold
    @temperature_threshold = SystemSettings.instance.temperature_threshold
    @humidity_threshold = SystemSettings.instance.humidity_threshold
    if SystemSettings.instance.update(settings_params) # if success
      redirect_to system_settings_configuration_path
    else # if not
      render :configuration
    end
  end

  private

  def settings_params
    params.permit(:moisture_threshold, :temperature_threshold, :humidity_threshold)
  end
end
