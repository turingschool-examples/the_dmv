class FacilityFactory

  def create_facilities(facility_location)
    new_facilities = []
    facility_location.each do |facility|
      facility_details = ({
        name: facility[:office_name],
        address: facility[:street_address_line_1],
        phone: facility[:public_phone_number]
      })
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end 
end