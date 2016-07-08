class App
  include ActiveModel::Model

  attr_accessor :template_path
  attr_reader :attributes

  def export(output_file_path=nil)
    output_path = output_file_path || ("#{Rails.root}/tmp/" +
      "application-#{SecureRandom.hex(10)}.pdf")
    pdftk.fill_form(template_path, output_path, attributes)
    output_path
  end

  def get_field_names 
    pdftk.get_field_names(template_path)
  end

  def template_path
    @template_path ||= ("#{Rails.root}/lib/pdf_templates/" +
      "#{self.class.name.gsub("Pdf", "").underscore}.pdf")
  end

  protected

  def attributes
    @attributes ||= {}
  end

  def fill(key, value)
    attributes[key.to_s] = value
  end

  def pdftk
    @pdftk ||= PdfForms.new(ENV["PDFTK_PATH"] || "/usr/local/bin/pdftk")
  end

  def fill_out
    raise "fill_out requires child class"
  end
end
