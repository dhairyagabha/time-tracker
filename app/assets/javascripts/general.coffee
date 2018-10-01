ready = ->
  $('select').select2({
    placeholder: 'Select an option',
    allowClear: true
  })
$(document).ready(ready)
$(document).on('turbolinks:load', ready)