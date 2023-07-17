class FacilityFactory

  def create_facilities(facility_location)
    new_facilities = []
    facility_location.each do |facility|
      facility_details = {
        name: facility[:name],
        address: facility[:address],
        phone: facility[:phone]
      }
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end 
end