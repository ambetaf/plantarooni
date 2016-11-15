Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/moisture_readings', to: 'moisture_sensor_readings#index', as: 'moisture_readings'
  get '/temperature_readings', to: 'temperature_sensor_readings#index', as: 'temperature_readings'
  get '/system_settings', to: 'system_settings#configuration', as: 'system_settings_configuration'
  put '/system_settings', to: 'system_settings#update', as: 'system_settings_update'
end
