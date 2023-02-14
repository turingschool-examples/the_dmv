class FacilityFactory
  def create_facilities(database)
    facility_specs = []
    database.each do |facility|
      facility_specs << Facility.new({name: facility[:title], address: concatenate(facility[:location_1][:human_address]), phone: facility[:phone_number]})
    end
    facility_specs
  end
  
  def concatenate(human_address) 
    human_address = JSON.parse(human_address)
    human_address["address"] + " " + human_address["city"] + " " + human_address["state"] + " " + human_address["zip"]
  end
end

# require'pry';binding.pry
