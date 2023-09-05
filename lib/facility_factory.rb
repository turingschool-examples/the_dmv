class FacilityFactory

  def initialize
  end

  def create_facilities(state_abbv)
    if state_abbv == "CO"
      do create_co_facilities
        if state_abbv == "MO"
          do create_mo_facilities
            if state_abbv == "NY"
              do create_ny_facilities
              else
                "sorry, we don't yet serve #{state_abbv}"
              end
  end

  def create_co_facilities
    facility_data = DmvDataService.new.co_dmv_office_locations
    facilities = []
    facility_data.each do |facility|
      facility_data = {
        name:facility[:dmv_office],
        address:"#{facility[:address_li]}, #{facility[:address__1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip]}",
        phone:facility[:phone],
        services:facility[:services_p],
        collected_fees:0,
        registered_vehicles:[]}
      facilities << Facility.new(facility_data)
    end
    facilities
  end

  def create_ny_facilities
    facility_data = DmvDataService.new.ny_dmv_office_locations
    facilities = []
    facility_data.each do |facility|
      facility_data = {
        name:facility[:office_name],
        address:"#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip_code]}",
        phone:facility[:public_phone_number],
        services:[],
        collected_fees:0,
        registered_vehicles:[]}
      facilities << Facility.new(facility_data)
    end
    facilities
  end

  def create_mo_facilities
    facility_data = DmvDataService.new.mo_dmv_office_locations
    facilities = []
    facility_data.each do |facility|
      facility_data = {
        name:facility[:name],
        address:"#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}",
        phone:facility[:phone],
        services:[],
        collected_fees:0,
        registered_vehicles:[]}
      facilities << Facility.new(facility_data)
    end
    facilities
  end
end