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

  def self.toggle(appliance)
    a = self.instance
    begin
      case appliance
      when 'sprinkler'
        a.update(sprinkler_manual_on: !a.sprinkler_manual_on)
        Board.sprinkler.send(a.sprinkler_manual_on ? :on : :off)
      when 'exhaust_fan'
        a.update(exhaust_manual_on: !a.exhaust_manual_on)
        Board.exhaust_fan.send(a.exhaust_manual_on ? :on : :off)
      when 'cooling_fan'
        a.update(cooling_manual_on: !a.cooling_manual_on)
        Board.cooling_fan.send(a.cooling_manual_on ? :on : :off)
      end
    rescue Exception
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
      begin
        Board.sprinkler.send(:off)
        Board.cooling_fan.send(:off)
        Board.exhaust_fan.send(:off)
      rescue Exception
      end
    else
      check_sensors
    end
  end

  def self.check_sensors
    begin
      Board.sprinkler.send(MoistureSensorReading.last.measurement < SystemSettings.instance.moisture_threshold ? :on : :off)
      Board.cooling_fan.send(TemperatureSensorReading.last.measurement > SystemSettings.instance.temperature_threshold ? :on : :off)
      Board.exhaust_fan.send(HumiditySensorReading.last.measurement > SystemSettings.instance.humidity_threshold ? :on : :off)
    rescue Exception
    end
  end
end
