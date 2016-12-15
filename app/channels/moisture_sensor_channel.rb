# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MoistureSensorChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'moisture_sensor_channel'
  end

  def unsubscribed
  end
end
