class FacilityFactory

def initialize
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

end