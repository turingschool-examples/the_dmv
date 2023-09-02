class FacilityConstructor

  def create_facilities(api_hash_array)
    new_facilities = []
    api_hash_array.each do |facility_data|
      facility = Facility.new(parse(facility_data))
      facility.services = add_services(facility_data)
      new_facilities << facility
    end
    new_facilities
  end

  def parse(api_hash)
    if api_hash[:state] == "CO"
      parsed_hash = co_parse(api_hash)
    elsif api_hash[:state] == "NY"
      parsed_hash = ny_parse(api_hash)
    else
      parsed_hash = api_hash
    end
    parsed_hash
  end
  
  def co_parse(api_hash)
    api_hash[:name] = api_hash[:dmv_office]
    api_hash[:address] = "#{api_hash[:address_li]} #{api_hash[:address__1]} #{api_hash[:city]} #{api_hash[:state]} #{api_hash[:zip]}"
    api_hash
  end

  def ny_parse(api_hash)
    api_hash[:name] = "#{api_hash[:office_name]} #{:office_type}"
    api_hash[:address] = "#{api_hash[:street_address_line_1]} #{api_hash[:street_address_line_2]} #{api_hash[:city]} #{api_hash[:state]} #{api_hash[:zip_code]}"
    if api_hash[:public_phone_number] != nil
      api_hash[:phone] = api_hash[:public_phone_number]
    else
      api_hash[:phone] = "(800) 698-2931"
    end
    api_hash
  end

  def add_services(api_hash)
    services = api_hash[:services_p]
    facility_services = []
    if services != nil
      facility_services << 'Vehicle Registration' if services.include?('registration')
      facility_services << 'Written Test' if services.include?('wtest')
      facility_services << 'Road Test'  if services.include?('rtest')
      facility_services << 'Renew License' if services.include?('renewals')
      facility_services
    end
  end
end