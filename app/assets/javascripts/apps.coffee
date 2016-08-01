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

  return
  