class TestPdfForm < App

  attr_accessor :first_name, :last_name, :address, :address_2, :city, :state,
    :zip_code, :age, :comments, :date

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
end
