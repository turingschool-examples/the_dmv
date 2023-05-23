class FacilityFactory
  def create_or_facilities(facilities)
    facilities.map do |facility|
      address_hash = JSON.parse(facility[:location_1][:human_address])
      formatted_address = address_hash["address"] + ", " + address_hash["city"] + ", " + address_hash["state"] + ", " + address_hash["zip"]
      facility_details = {}
      facility_details[:name] = facility[:title]
      facility_details[:phone] = facility[:phone_number]
      facility_details[:address] = formatted_address
      Facility.new(facility_details)
    end
  end

  def create_ny_facilities(facilities)
    facilities.map do |facility|
      facility_details = {}
      facility_details[:name] = facility[:office_name].split.map(&:capitalize).join(" ")
      facility_details[:phone] = formatted_ny_phone(facility[:public_phone_number])
      facility_details[:address] = formatted_ny_address(facility)
      Facility.new(facility_details)
    end
  end

  def formatted_ny_phone(number)
    number ? number.insert(3, '-').insert(-5, '-') : nil
  end

  def formatted_ny_address(facility)
    formatted_ny_address = facility[:street_address_line_1] + ", " +  facility[:city] + ", " + facility[:state] + ", " + facility[:zip_code]
    formatted_ny_address.split.map(&:capitalize).join(' ')
  end

  def create_mo_facilities(facilities)
    facilities.map do |facility|
      facility_details = {}
      facility_details[:name] = facility[:name]
      facility_details[:phone] = formatted_mo_phone(facility[:phone])
      facility_details[:address] = formatted_mo_address(facility)
      Facility.new(facility_details)
    end
  end

  def formatted_mo_address(facility)
    new_address = facility[:address1] + ", " + facility[:city] + ", " + facility[:state] + ", " + facility[:zipcode]
    new_address.split.map(&:capitalize).join(' ')
  end

  def formatted_mo_phone(number)
    number.delete(" ()").insert(3, "-") unless number == nil
  end
end