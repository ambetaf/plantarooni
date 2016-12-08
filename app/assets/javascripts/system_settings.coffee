jQuery ->
  $('#override').bootstrapSwitch('state', this.checked)
  $('#override').on('switchChange.bootstrapSwitch', (event, state) ->
    $.post('/system_settings/toggle', ->
      window.location.replace(window.location.pathname)
      )
  )
  $('#exhaust_fan').bootstrapSwitch('state', this.checked)
  $('#cooling_fan').bootstrapSwitch('state', this.checked)
  $('#sprinkler').bootstrapSwitch('state', this.checked)

  $('.switch').on('switchChange.bootstrapSwitch', (event, state) ->
    $.post('/system_settings/toggle_appliance', {appliance: this.id})
  )
