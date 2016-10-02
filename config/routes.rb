Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/moisture_readings', to: 'moisture_sensor_readings#index', as: 'moisture_readings'
end
