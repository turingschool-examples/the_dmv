class FacilityFactory
    attr_reader :facilities_created

  def initialize
    @facilities_created = []    
  end

  def create_facilities(data)
    data.each do |dmv_data|
      @facilities_created << Facility.new({
      name: format_facility_name(dmv_data),
      address: format_facility_address(dmv_data),
      phone: format_facility_phone(dmv_data)
      })
    end 
  end

  def format_facility_name(data)
    if data[:state] == "CO"
      data[:dmv_office]
    elsif data[:state] == "NY"
      capitalize_string("#{data[:office_name]} #{data[:office_type]}")
    end
  end

  def format_facility_address(data)
    if data[:state] == "CO"
      ("#{data[:address_li]}#{" " + "#{data[:address__1]}" if data[:address__1] } #{data[:city]} #{data[:state]} #{data[:zip]}")  
    elsif data[:state] == "NY"
      capitalize_string("#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}")
    end
  end

  def format_facility_phone(data)
    if data[:state] == "CO"
      data[:phone]
    end
  end

  def capitalize_string(string)
    data_string = string.split.map do |word| 
      word.include?("NY") ? word : word.capitalize
    end 
    data_string.join(" ")
  end
end

