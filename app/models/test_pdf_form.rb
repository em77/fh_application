class TestPdfForm < App

  attr_accessor :first_name, :last_name, :address, :address_2, :city, :state,
    :zip_code, :age, :comments, :date, :psych_eval_file_name,
    :psych_eval_content_type, :psych_eval, :psych_eval_file_size,
    :psych_eval_updated_at, :id

  has_attached_file :psych_eval,
    path: ":rails_root/tmp/:style/:save_name.:extension",
    url: "/tmp/:style/:save_name.:extension",
    default_url: "/tmp/:style/missing.:extension",
    storage: :filesystem
  do_not_validate_attachment_file_type :psych_eval
  # validates_attachment_content_type :psych_eval, content_type:
  #   # pdf, doc, and docx
  #   ["application/pdf",
  #    "application/msword",
  #    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]

  Paperclip.interpolates :save_name do |attachment, style|
    attachment.instance.save_name
  end

  def fill_out
    fill :date, Date.today.to_s
    simple_fields = [:first_name, :last_name, :address, :address_2, :city,
      :state, :zip_code, :comments]
    simple_fields.each do |field|
      fill(field, self.send(field))
    end
    fill(:age, case self.age.to_i
      when nil then nil
      when 0..17 then '0_17'
      when 18..34 then '18_34'
      when 35..54 then '35_54'
      else '55_plus'
    end)
  end

  def save_name
    self.psych_eval_file_name + "-#{unique_hex}"
  end

  def unique_hex
    @unique_hex ||= SecureRandom.hex(10)
  end
end
