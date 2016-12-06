class SystemSettings < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one AppSettings row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  def self.instance
    # there will be only one row, and its ID must be '1'
    begin
      find(1)
    rescue ActiveRecord::RecordNotFound
      # slight race condition here, but it will only happen once
      row = SystemSettings.new
      row.singleton_guard = 0
      row.save!
      row
    end
  end

  def self.toggle_manual_control
    self.instance.update(manual_control: !self.instance.manual_control)
    if self.instance.manual_control
      self.instance.update(
        sprinkler_manual_on: false,
        cooling_manual_on: false,
        exhaust_manual_on: false
      )
    end
  end
end
