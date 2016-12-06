class AddHumidityThresholdToSystemSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :system_settings, :humidity_threshold, :float
  end
end
