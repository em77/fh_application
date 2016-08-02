$(document).on "turbolinks:load", ->

  # Datepicker fields
  # $(".datepicker").datepicker format: "M dd, yyyy"
  $(".datepicker").datepicker(format: "yyyy",
    viewMode: "years", 
    minViewMode: "years")

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

  # Hide insurance number field if insurance is "None", hide other_insurance
  # field unless "Other" is selected, and hide medicaid_comp field if it isn't
  # selected
  $("#_insurance_name").change ->
    selected = $("#_insurance_name option:selected").text()
    if selected == "None"
      $("#insurance-num").hide()
      $("#insurance-other").hide()
      $("#medicaid-managed").hide()
    else if selected == "Other (fill in below)"
      $("#insurance-num").show()
      $("#insurance-other").show()
      $("#medicaid-managed").hide()
    else if selected == "Medicaid Managed Care (fill in name of company below)"
      $("#insurance-num").show()
      $("#insurance-other").hide()
      $("#medicaid-managed").show()
    else
      $("#insurance-num").show()
      $("#insurance-other").hide()
      $("#medicaid-managed").hide()
    return

  return
  