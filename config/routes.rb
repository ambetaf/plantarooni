Rails.application.routes.draw do
  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users
  resources :plants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'moisture_sensor_readings#index'
  get '/moisture_readings', to: 'moisture_sensor_readings#index', as: 'moisture_readings'
  get '/temperature_readings', to: 'temperature_sensor_readings#index', as: 'temperature_readings'
  get '/humidity_readings', to: 'humidity_sensor_readings#index', as: 'humidity_readings'
  get '/select_plant', to: 'plants#index', as: 'select_plants'
  get '/update_threshold/:id', to: 'plants#update_threshold', as: 'update_threshold'
  get '/system_settings', to: 'system_settings#configuration', as: 'system_settings_configuration'
  put '/system_settings', to: 'system_settings#update', as: 'system_settings_update'
  post '/system_settings/toggle'
end
