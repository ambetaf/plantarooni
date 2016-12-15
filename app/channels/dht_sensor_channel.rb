# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class DhtSensorChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'dht_sensor_channel'
    if @subscribers == 0
      JobStopper.stop_dht_sensor = false
      RealTimeDhtSensorWorker.perform_async
    end
    @subscribers += 1
  end

  def unsubscribed
    @subscribers -= 1
    if @subscribers == 0
      JobStopper.stop_dht_sensor = true
    end
  end
end
