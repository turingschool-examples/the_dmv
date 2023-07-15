class FacilityFactory
  
  def initialize
    @facilities = []
  end

  def create_locations(locations)
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
    end
  end

  def format_address(data)
    if data[:state] == "CO"
      address_parts = [data[:address_li], data[:address__1], data[:city], data[:state], data[:zip]]
      address_parts.compact.join(" ")
    end
  end

  def format_phone(data)
    if data[:state] == "CO"
      data[:phone]
    end
  end
end
