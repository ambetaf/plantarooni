class CreateSystemSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :system_settings do |t|
      t.integer :singleton_guard
      t.integer :moisture_threshold

      t.timestamps
    end
  end
end
