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
    api_hash[:name] = api_hash[:dmv_office]
    api_hash[:address] = "#{api_hash[:address_li]} #{api_hash[:address__1]} #{api_hash[:city]} #{api_hash[:state]} #{api_hash[:zip]}"
    api_hash
  end

  def add_services(api_hash)
    services = api_hash[:services_p]
    facility_services = []
    facility_services << 'Vehicle Registration' if services.include?('registration')
    facility_services << 'Written Test' if services.include?('wtest')
    facility_services << 'Road Test'  if services.include?('rtest')
    facility_services << 'Renew License' if services.include?('renewals')
    facility_services
  end
end