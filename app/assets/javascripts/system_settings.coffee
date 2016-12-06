jQuery ->
  $('#override').bootstrapSwitch('state', this.checked)
  $('#override').on('switchChange.bootstrapSwitch', (event, state) ->
    $.post('/system_settings/toggle', ->
      window.location.replace(window.location.pathname)
      )
  )
  $('#switch1').bootstrapSwitch('state', this.checked)
  $('#switch2').bootstrapSwitch('state', this.checked)
  $('#switch3').bootstrapSwitch('state', this.checked)
