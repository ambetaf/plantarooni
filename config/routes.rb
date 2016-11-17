Rails.application.routes.draw do
  get 'humidity_sensor_reading/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/moisture_readings', to: 'moisture_sensor_readings#index', as: 'moisture_readings'
  get '/system_settings', to: 'system_settings#configuration', as: 'system_settings_configuration'
  put '/system_settings', to: 'system_settings#update', as: 'system_settings_update'
end
