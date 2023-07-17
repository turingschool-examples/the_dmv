class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(locations)
    locations.each do |site|
    details = {
      name: format_name(site),
      address: format_address(site),
      phone: format_phone(site)
    }
    @facilities << Facility.new(details)
    end
  end

  def format_name(data)
    if data[:state] == "CO"
      data[:dmv_office]
    elsif data[:state] == "NY"
      data[:office_name]
      #all caps, do I need DMV in front?
    elsif data[:state] == "MO"
      data[:name]
    end
    
  end

  def format_address(data)
    if data[:state] == "CO"
      address_parts = [data[:address_li], data[:address__1], data[:city], data[:state], data[:zip]]
      address_parts.compact.join(" ")
    elsif data[:state] == "NY"
      address_parts = [data[:street_address_line_1], data[:street_address_line_2], data[:city], data[:state], data[:zip_code]]
      address_parts.compact.join(" ")
      #all caps
    elsif data[:state] == "MO"
      address_parts = [data[:address1], data[:city], data[:state], data[:zipcode]]
      address_parts.compact.join(" ")
    end
  end

  def format_phone(data)
    if data[:state] == "CO"
      data[:phone]
    elsif data[:state] == "NY"
      if data[:public_phone_number] != nil
      data[:public_phone_number].insert(6, "-").insert(3, ") ").insert(0, "(")
      else
        data[:public_phone_number]  
      end
    elsif data[:state] == "MO"
      data[:phone]
    end
  end

end
