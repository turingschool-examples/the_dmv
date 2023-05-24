class FacilityArchitect

  def or_design_facility(facility_array)
    updated_keys = or_facility_key_updater(facility_array)
    updated_keys.map do |attr|
      Facility.new(attr)
    end
  end

  def or_facility_key_updater(unformatted_facilities)
    flat_array = [unformatted_facilities].flatten
    new_keys = flat_array.each do |facility|
      parsed_address = JSON.parse(facility[:location_1][:human_address])
      facility[:name] = facility[:title]
      facility[:phone] = facility[:phone_number]
      facility[:address] = parsed_address.values.join(", ")
    end
  end

  def ny_design_facility(facility_array)
    updated_keys = ny_facility_key_updater(facility_array)
    updated_keys.map do |attr|
      Facility.new(attr)
    end
  end

  # A NOTE FOR MYSELF! - .split.map{|word| word.capitalize}.join(" ") - This splits the string into an array, 
  # maps and capitializes each element and then joins the elements into a string

  # Could not get hyphen_phone_num.insert(-8, '-').insert(-5, '-') to work in the .each block.. (ノಠ皿ಠ)ノ rrghh!

  def ny_facility_key_updater(unformatted_facilities)
    flat_array = [unformatted_facilities].flatten
    new_keys = flat_array.each do |facility|
      capitailized_name = "#{facility[:office_name]} #{facility[:office_type]}"
      hyphen_phone_num = facility[:public_phone_number]
      capitailized_address = "#{facility[:street_address_line_1]} #{facility[:street_address_line_2]}, #{facility[:city]} #{facility[:state]}, #{facility[:zip_code]}"
      facility[:name] = capitailized_name.split.map{|word| word.capitalize}.join(" ")
      facility[:phone] = hyphen_phone_num
      facility[:address] = capitailized_address.split.map{|word| word.capitalize}.join(" ")
    end
  end

  def mo_design_facility(facility_array)
    updated_keys = mo_facility_key_updater(facility_array)
    updated_keys.map do |attr|
      Facility.new(attr)
    end
  end

  def mo_facility_key_updater(unformatted_facilities)
    flat_array = [unformatted_facilities].flatten
    new_keys = flat_array.each do |facility|
      capitailized_name = facility[:name]
      capitailized_address = "#{facility[:address1]}, #{facility[:city]} #{facility[:state]}, #{facility[:zipcode]}"
      facility[:name] = capitailized_name.split.map{|word| word.capitalize}.join(" ")
      facility[:address] = capitailized_address.split.map{|word| word.capitalize}.join(" ")
    end
  end
end
