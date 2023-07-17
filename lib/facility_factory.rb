class FacilityFactory

  def create_mo_facilities(mo_facility_location)
    new_facilities = []
    facility_location.each do |facility|
      facility_details = ({
        name: facility[:name],
        address: facility[:address1],
        phone: facility[:phone]
      })
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end 
end