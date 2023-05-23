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
      formatted_ny_address = facility[:street_address_line_1] + ", " +  facility[:city] + ", " + facility[:state] + ", " + facility[:zip_code]
      # phone = facility[:public_phone_number]  
      # formatted_phone = phone ? phone.insert(3, '-').insert(-5, '-') : nil
      formatted_phone = facility[:public_phone_number].insert(3, '-').insert(-5, '-') unless facility[:public_phone_number] == nil
      facility_details = {}
      facility_details[:name] = facility[:office_name].split.map(&:capitalize).join(" ")
      facility_details[:phone] = formatted_phone
      facility_details[:address] = formatted_ny_address
      Facility.new(facility_details)
    end
  end

  def create_mo_facilities(facilities)
    facilities.map do |facility|
      #require 'pry'; binding.pry
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