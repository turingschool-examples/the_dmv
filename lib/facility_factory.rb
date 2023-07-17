class FacilityFactory

  def create_ny_facilities(ny_facility_location)
    new_facilities = []
    ny_facility_location.each do |facility|
      facility_details = ({
        name: facility[:office_name],
        address: facility[:street_address_line_1],
        phone: facility[:public_phone_number]
      })
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end 
  
  def create_mo_facilities(mo_facility_location)
    new_facilities = []
    mo_facility_location.each do |facility|
      facility_details = ({
        name: facility[:name],
        address: facility[:address1],
        phone: facility[:phone]
      })
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end 

  def create_co_facilities(co_facility_location)
    new_facilities = []
    co_facility_location.each do |facility|
      facility_details = ({
        name: facility[:dmv_office],
        address: facility[:address_li],
        phone: facility[:phone]
      })
      new_facilities << Facility.new(facility_details)
    end
    new_facilities
  end

  def create_wa_ev_facilities(wa_ev_facility_location)
    
  end
end