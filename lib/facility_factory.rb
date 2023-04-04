class FacilityFactory
  attr_reader :new_facilities

  def initialize
    @new_facilities = []
  end

  def create_facilities(facilities)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    wa_registrations(location_details)
    @created_vehicles
  end 
   
  
  def checks_location(location_data)
      dmv_office_locations(location_data)
  end
  
  def dmv_office_locations(location_data)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
     location_data == or_dmv_office_locations
        or_dmv_office_locations.each do |office|
           location_data = {
            name: office[:title],
            address: office[:human_address],
            phone: office[:phone_number],
            }
            @new_facilities << (offices = Facility.new(location_data))
        end
        @new_facilities
      end
   
  end