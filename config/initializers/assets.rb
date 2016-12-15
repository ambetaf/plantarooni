# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( default.js )
%w( home humidity_sensor_readings plants system_settings temperature_sensor_readings user_sessions ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
end

Rails.application.config.assets.precompile += %w( cable.js )
Rails.application.config.assets.precompile += %w( channels/moisture_sensor.js )
Rails.application.config.assets.precompile += %w( channels/dht_sensor.js )
