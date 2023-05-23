require "json"


class FacilityFactory
  def create_facilities(dmv_facilities_data)
    dmv_facilities_data.map do |facility_data|
      standardized_data = standardize_facility_data(facility_data)
      Facility.new(standardized_data)
    end
  end

  def standardize_facility_data(facility_data)
    data = {
      name: standardize_name(facility_data),
      address: standardize_address(facility_data),
      phone: standardize_phone(facility_data)
    }
  end

  def standardize_name(facility_data)
    if facility_data.has_key?(:website) && facility_data[:website].include?("oregon")
      facility_data[:title]
    elsif facility_data[:state] == "NY"
      facility_data[:office_name]
    else facility_data[:state] == "MO"
      facility_data[:name]
    end
  end

  def standardize_address(facility_data)
    if facility_data.has_key?(:website) && facility_data[:website].include?("oregon")
      address = JSON.parse(facility_data[:location_1][:human_address], :symbolize_names => true)
      "#{address[:address]}, #{address[:city]} #{address[:state]} #{address[:zip]}"
    elsif facility_data[:state] == "NY"
      if facility_data[:street_address_line_2].nil?
        "#{facility_data[:street_address_line_1]}, #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip_code]}" 
      else 
        "#{facility_data[:street_address_line_1]} #{facility_data[:street_address_line_2]}, #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip_code]}" 
      end
    else facility_data[:state] == "MO"
      "#{facility_data[:address1]}, #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zipcode]}"
    end
  end

  def standardize_phone(facility_data)
    if facility_data.has_key?(:website) && facility_data[:website].include?("oregon")
      facility_data[:phone_number]
    elsif facility_data[:state] == "NY"
      if facility_data[:public_phone_number].nil?
        nil
      else
      facility_data[:public_phone_number].insert(3, "-").insert(7, "-")
      end
    else facility_data[:state] == "MO"
      if facility_data[:phone].nil?
        nil
      else
        facility_data[:phone].delete("()").delete(" ").insert(3, "-")
      end
    end
  end
end