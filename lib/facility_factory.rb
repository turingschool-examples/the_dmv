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
    else data[:state] == "MO"
      capitalize_string("#{data[:name]}")
    end
  end

  def format_facility_address(data)
    if data[:state] == "CO"
      ("#{data[:address_li]}#{" " + "#{data[:address__1]}" if data[:address__1] } #{data[:city]} #{data[:state]} #{data[:zip]}")  
    elsif data[:state] == "NY"
      capitalize_string("#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}")
    else data[:state] == "MO"
      capitalize_string("#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zipcode]}")
    end
  end

  def format_facility_phone(data)
    if data[:state] == "CO"
      data[:phone]
    elsif data[:state] == "NY"
      format_digits(data[:public_phone_number])
    end
  end

  def capitalize_string(string)
    state_abbreviations = ["NY", "MO"]
    data_string = string.split.map do |word| 
      state_abbreviations.include?(word) ? word : word.capitalize
    end 
    data_string.join(" ")
  end

  def format_digits(digit_string)
    return "No phone number listed" if digit_string.nil?
    formatted_digits = ("(" + digit_string[0, 3] + ") " + digit_string[3, 3] + "-" + digit_string[6, 4])
  end
end

