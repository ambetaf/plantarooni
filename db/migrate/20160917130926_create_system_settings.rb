class CreateSystemSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :system_settings do |t|
      t.integer :singleton_guard
      t.integer :moisture_threshold
      t.float :temperature_threshold
      t.boolean :manual_control
      t.boolean :sprinkler_manual_on
      t.boolean :cooling_manual_on
      t.boolean :exhaust_manual_on

      t.timestamps
    end
  end
end
