jQuery ->
  $('#override').bootstrapSwitch('state', this.checked)
  $('#override').on('switchChange.bootstrapSwitch', (event, state) ->
    $.post('/system_settings/toggle')
    window.location.replace(window.location.pathname)
  )
  $('.bsswitch').bootstrapSwitch('state', this.checked)
