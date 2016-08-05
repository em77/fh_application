module AppHelper
  # Test checkboxes
  def is_checked?(checkbox_param)
    checkbox_param == "1"
  end

  # Test radio buttons
  def radio_checked?(radio_field, button_text)
    selected_radio = params[radio_field]
    (selected_radio == button_text) ? true : false
  end
end
