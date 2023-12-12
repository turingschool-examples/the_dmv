class FacilityFactory
   
  def create_facilities(dmv_info)
    dmv_info.map { |facility_data| create_facility(facility_data) }
  end
 
  def create_facility(facility_data)
    state = facility_data[:state]
    
    if state == "CO"
      facility_details = create_co_facility(facility_data)
    elsif state == "NY"
      facility_details = create_ny_facility(facility_data)
    elsif state == "MO"
      facility_details = create_mo_facility(facility_data)
    else
        "Unsupported state: #{state}"
    end
    Facility.new(facility_details)
  end
 
  def create_co_facility(data)
    {
      name: data[:dmv_office],
      address: "#{data[:address_li]} #{data[:address__1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
      phone: data[:phone],
      services: []
    }
  end
 
  def create_ny_facility(data)
    {
      name: data[:office_name],
      address: "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}",
      phone: data[:public_phone_number],
      services: []
    }
  end
 
  def create_mo_facility(data)
    {
      name: data[:name],
      address: "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}",
      phone: data[:phone],
      services: []
    }
  end
end
 