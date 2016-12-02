class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :humidity_threshold
      t.integer :moisture_threshold
      t.integer :temperature_sensor

      t.timestamps
    end
  end
end
