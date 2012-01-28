jQuery ->
  $('#job_location_id').parent().hide()
  states = $('#job_location_id').html()
  $('#job_state_id').change ->
    state = $('#job_state_id :selected').text()
    escaped_country = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#job_location_id').html(options)
      $('#job_location_id').parent().show()
    else
      $('#job_location_id').empty()
      $('#job_location_id').parent().hide()