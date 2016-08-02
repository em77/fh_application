$(document).on "turbolinks:load", ->

  # Datepicker fields
  $(".datepicker").datepicker format: "M dd, yyyy"

  # Total income field auto-filler
  $(".income-field").change ->
    total = (selector) ->
      sum = 0
      $(selector).each ->
        sum += Number( $(this).val() )
        return
      sum

    $("#total-field").val( total(".income-field") )
    return

  # Hide ACS involvement field if not residing with minors
  $("#_reside_with_minors").change ->
    selected = $("#_reside_with_minors option:selected").text()
    if selected == "Yes"
      $("#acs-select").show()
    else
      $("#acs-select").hide()
    return

  return
  