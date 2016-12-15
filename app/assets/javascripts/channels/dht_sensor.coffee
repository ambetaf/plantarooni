App.dht_sensor = App.cable.subscriptions.create "DhtSensorChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    jQuery ->
      $('#current_humidity').html(data.humidity)
      $('#current_temperaturer').html(data.temp)
