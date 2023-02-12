class FacilityFactory
  def initialize
  end

  def create_facilities(source)
    if source.size == 59
      create_or_facility(source)
    elsif source.size == 169
      create_ny_facility(source)
    end
  end

  def create_or_facility(source)
    source.map do |facility|
      Facility.new({name: facility[:title], address: JSON.parse(facility.
      dig(:location_1, :human_address)).values.join(' '), 
      phone: facility[:phone_number]})
    end
  end

  def create_ny_facility(source)
    source.map do |facility|
      Facility.new({name: facility[:office_name], address: facility.
      fetch_values(:street_address_line_1, :city, :state, :zip_code).
      join(' '), phone: facility[:public_phone_number]})
    end
  end
end