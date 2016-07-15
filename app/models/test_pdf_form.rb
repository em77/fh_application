class TestPdfForm < App

  extend CarrierWave::Mount

  attr_accessor :first_name, :last_name, :address, :address_2, :city, :state,
    :zip_code, :age, :comments, :date, :psych_eval, :id

  mount_uploader :psych_eval, PsychEvalUploader

  # validates :psych_eval, file_content_type: { exclude: ['image/jpeg', 'text/plain'] }


    # :psych_eval_file_name,
    # :psych_eval_file_size, :psych_eval_updated_at, :psych_eval_content_type

  # has_attached_file :psych_eval,
  #   path: ":rails_root/tmp/:style/:attachment_save_basename.:extension",
  #   url: "/tmp/:style/:attachment_save_basename.:extension",
  #   default_url: "/tmp/:style/missing.:extension",
  #   storage: :filesystem

  # do_not_validate_attachment_file_type :psych_eval
  # validates_attachment_file_name :psych_eval, matches:
  #   [/pdf\Z/, /doc\Z/, /docx\Z/]

  # validates :psych_eval, file_content_type:
  #   {
  #     allow:
  #       [
  #         "application/pdf",
  #         "application/msword",
  #         "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  #       ], mode: :strict
  #   }

  # validates_attachment_content_type :psych_eval, content_type:
  #   # pdf, doc, and docx
  #   ["application/pdf",
  #    "application/msword",
  #    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]

  # Paperclip.interpolates :attachment_save_basename do |attachment, style|
  #   attachment.instance.attachment_save_basename
  # end

  def attachment_content_whitelist
    ["application/pdf",
     "application/msword",
     "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]
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

  def attachment_save_basename
    file_path = self.psych_eval.path
    base_save_name = File.basename(file_path, File.extname(file_path))
    base_save_name + "-#{unique_hex}"
  end

  def unique_hex
    @unique_hex ||= SecureRandom.hex(10)
  end

  # def save
  #   run_callbacks :save
  #   return true
  # end

  def save
    self.store_psych_eval!
  end
end
