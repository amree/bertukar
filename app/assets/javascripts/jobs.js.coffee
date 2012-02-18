$ ->
  setupLoc = ->
    $(".job_location_id").each ->
      loc = $(this)

      if $(loc).prev().val() == ""
        $(loc).hide()
        states = $(loc).html()
        $(loc).prev().change ->
          state = $(loc).prev().find(":selected").text()
          escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
          options = $(states).filter("optgroup[label='#{escaped_state}']").html()
          if options
            $(loc).html(options)
            $(loc).show()
          else
            $(loc).empty()
            $(loc).hide()

  toggleNextJobs = (e) ->
    if $(e).val() == "true"
      $("#next-jobs").show()
    else
      $("#next-jobs").hide()

  ## Some hooks

  # Add another link pointing to the real link (till i know how to hook an event after the insertion)
  # Rerun setupLoc() everytime user add new nested element
  $("#add-next-job").bind "click", ->
    $('.add_nested_fields').click()
    setupLoc()

  # Show/hide based on job's type
  $("#job_is_exchange").change ->
    toggleNextJobs(this)

  ## Run by default
  setupLoc()
  toggleNextJobs($("#job_is_exchange"))
  $('.add_nested_fields').hide()
