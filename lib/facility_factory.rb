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
    array = source.map do |facility|
      Facility.new({name: facility[:title], address: JSON.parse(facility.
      dig(:location_1, :human_address)).values.join(' '), 
      phone: facility[:phone_number]})
    end
  end

  def create_ny_facility(source)
    array = sour.map do |facility|
      Facility.new({name: facility[:office_name], address: })
    end
  end
end