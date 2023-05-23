class FacilityArchitect

  def design_facility(facility_array)
    updated_keys = facility_key_updater(facility_array)
    updated_keys.map do |attr|
      Facility.new(attr)
    end
  end

  def facility_key_updater(unformatted_facilities)
    flattened_array = [unformatted_facilities].flatten
    new_keys = flattened_array.each do |facility|
      facility[:name] = facility[:title]
      facility[:phone] = facility[:phone_number]
      facility[:address] = JSON.parse(facility[:location_1][:human_address])
    end
    new_keys
  end

end