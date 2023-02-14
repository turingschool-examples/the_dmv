class FacilityFactory

  def create_facilities_oregon(facility_database)

    facility_instances = []
    facility_database.each do |facility|
     address_data = facility[:location_1][:human_address]
     address = JSON.parse(address_data)
      facility_instances.push(Facility.new({name: facility[:title], address: address.values.join(' ') , phone: facility[:phone_number]}))
    end
    facility_instances
  end

  
end