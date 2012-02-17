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

  toggleNextJob = (e) ->
    if $(e).val() == "true"
      $("#next-jobs").show()
      $(".nested-fields").show()
    else
      $("#next-jobs").hide()
      $(".nested-fields").hide()

  $("#next-jobs").bind "insertion-callback", ->
    setupLoc()

  $("#job_is_exchange").change ->
    toggleNextJob(this)

  setupLoc()
  toggleNextJob($("#job_is_exchange"))
