class FacilityLocation


  def create_facility(locations)
    dmv_locations = formatted_location(locations)
    facilities = []
    dmv_locations.each do |location|
      facilities << Facility.new(location)
    end
    facilities
  end

  def formatted_location(locations)
    dmv_formatted = []
    [locations].flatten.each do |location|
      location_data = {}
      location_data[:name] = (location[:title] || location[:office_name] || location[:name])
      location_data[:address] = parsed_address(location)
      location_data[:phone] = (location[:phone_number] || location[:public_phone_number] || location[:phone])
      dmv_formatted << location_data
    end
    dmv_formatted
  end

end
