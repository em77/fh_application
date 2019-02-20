$(document).on "turbolinks:load", ->
  # Datepicker fields for selecting specific dates
  $(".datepicker").datepicker(format: "M dd, yyyy")

  # Datepicker fields for selecting only month and year
  $(".datepicker-months-only").datepicker(format: "M, yyyy", \
    viewMode: "months", \
    minViewMode: "months")

  # Auto-fill age field from DOB
  $('#dob-field').change ->
    now = moment()
    dob = moment($('#dob-field').val())
    duration = moment.duration(now.diff(dob))
    years = duration.asYears()
    $('#age-field').val(Math.round(years))
    return

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

  # Required field checker for Safari
  $("form").submit (e) ->
    if !e.target.checkValidity()
      ref = $(this).find("[required]")
      $(ref).each ->
        if $(this).val() == ""
          alert "This field cannot be blank:\n" + $(this).prev("label").text()
          $(this).focus()
          e.preventDefault()
          return false
        return true
      return

  return
  